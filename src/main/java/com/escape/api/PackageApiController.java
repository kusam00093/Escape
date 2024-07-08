package com.escape.api;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.naming.directory.SearchResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.escape.accommodation.domain.Payment;
import com.escape.accommodation.domain.RoomReservation;
import com.escape.accommodation.domain.SearchRequest;
import com.escape.accommodation.service.AccommodationApiService;
import com.escape.accommodation.service.KakaoPayService;
import com.escape.accommodation.service.NaverPayService;
import com.escape.domain.Package_ReservationVo;
import com.escape.login.domain.Person;
import com.escape.login.domain.User;
import com.escape.login.mapper.MypageMapper;
import com.escape.service.PackageApiService;
import com.escape.service.PackageKakaoPayService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/PackageApi")
public class PackageApiController {
    
    @Autowired
    private PackageApiService packageApiService;
    
    @Autowired
    private AccommodationApiService accommodationApiService;
    
    @Autowired
    private MypageMapper mypageMapper;
    
    @Autowired
    @Qualifier("packageKakaoPayService")
    private PackageKakaoPayService kakaoPayService;

    

    
    @PostMapping("/usePoints")
    public ResponseEntity<String> usePoints(
    		@RequestParam int pointsToUse,
    		@SessionAttribute(name = "login", required = false) User user) {
        Person person = mypageMapper.getPersonByuser_idx(user.getUser_idx());
        

        boolean success = accommodationApiService.usePoints(person.getPerson_idx(), pointsToUse);
        if (success) {
            return ResponseEntity.ok("Points used successfully");
        } else {
            return ResponseEntity.status(HttpServletResponse.SC_BAD_REQUEST).body("Insufficient points");
        }
    }
    
    @RequestMapping("/Payment")
    public ResponseEntity<?> processPayment(
    		@RequestBody Map<String, Object> paymentData,
    		@SessionAttribute(name = "login", required = false) User user,
    		HttpSession session) {
        if (user == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("error", "Unauthorized"));
        }

        // 디버깅 로그 추가
        System.out.println("paymentData: " + paymentData);

//        String date = (String) paymentData.get("date");
//        String place = (String) paymentData.get("place");
//        int guest;
//        int room_idx;
        int package_idx;
        int reservationPrice;
        int reservation_su;
        int finalPrice;
        int pointsToUse;
        String paymentMethod = (String) paymentData.get("paymentMethod");

        
        try {
            package_idx = Integer.parseInt(paymentData.get("package_idx1").toString());
            reservationPrice = Integer.parseInt(paymentData.get("reservationPrice").toString());
            finalPrice = Integer.parseInt(paymentData.get("finalPrice").toString());
            reservation_su = Integer.parseInt(paymentData.get("reservationCount").toString());
            
            pointsToUse = Integer.parseInt(paymentData.get("pointsToUse").toString());
            paymentMethod = (String) paymentData.get("paymentMethod");

        } catch (ClassCastException | NumberFormatException e) {
            e.printStackTrace(); // 예외 로그 출력
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("error", "Invalid number format"));
        }

        // 디버깅 로그 추가
        System.out.println("Parsed values - guest: " + ", room_idx: " + package_idx + ", reservationPrice: " + reservationPrice + ", finalPrice: " + finalPrice);

        // 날짜 파싱 로직
//        String[] dateSplit = date.split("~");
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("M월 d일 yyyy", Locale.KOREAN);
//        
//        LocalDate checkInDate;
//        LocalDate checkOutDate;
        
//        try {
//            String checkInDateString = dateSplit[0].trim().split("\\(")[0].trim();
//            String checkOutDateString = dateSplit[1].trim().split("\\(")[0].trim();
//            int currentYear = LocalDate.now().getYear();
//
//            checkInDate = LocalDate.parse(checkInDateString + " " + currentYear, formatter);
//            checkOutDate = LocalDate.parse(checkOutDateString + " " + currentYear, formatter);
//        } catch (DateTimeParseException e) {
//            e.printStackTrace(); // 예외 로그 출력
//            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("error", "Invalid date format"));
//        }

        // 디버깅 로그 추가
//        System.out.println("Parsed dates - checkInDate: " + checkInDate + ", checkOutDate: " + checkOutDate);
//
//        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//        String checkInDateFormatted = checkInDate.format(dateFormatter);
//        String checkOutDateFormatted = checkOutDate.format(dateFormatter);
        
        Package_ReservationVo reservationVo = new Package_ReservationVo();
        reservationVo.setUser_idx(user.getUser_idx());
        reservationVo.setPackage_idx(package_idx);
//        roomReservation.setReservation_guest(guest);
        reservationVo.setReservation_price(finalPrice);
        reservationVo.setReservation_su(reservation_su);
//        roomReservation.setCheck_in_date(checkInDateFormatted); // 문자열로 설정
//        roomReservation.setCheck_out_date(checkOutDateFormatted); // 문자열로 설정
        reservationVo.setState(2); // 예약 상태를 대기 중으로 설정
//        reservationVo.setCreated(LocalDateTime.now());
        Payment payment = new Payment();
        payment.setUser_idx(user.getUser_idx());
        payment.setPrice(finalPrice);
        payment.setState(1); // 결제 상태를 완료로 설정
        payment.setCreated(LocalDateTime.now());

        boolean success = packageApiService.createPackageReservationAndPayment(reservationVo, payment);
        if (success) {
            // 포인트 사용을 성공적으로 처리했는지 확인
            if (pointsToUse > 0) {
                boolean pointsUsed = accommodationApiService.usePoints(user.getUser_idx(), pointsToUse);
                if (!pointsUsed) {
                    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                            .body(Map.of("error", "Points usage failed"));
                }
            }

            if ("KAKAOPAY".equals(paymentMethod)) {
            	System.out.println("여기까지 오나?111111111111111111111");
                String orderId = "order_" + System.currentTimeMillis();
                String itemName = "패키지 예약";
                String paymentResponse = kakaoPayService.initiatePayment(finalPrice, orderId, itemName);
                System.out.println("paymentResponse1111111111111111"+paymentResponse);
                String redirectUrl = "/PackageApi/payment/success";
                session.setAttribute("finalPrice", finalPrice); // 최종 금액 세션에 저장
                return ResponseEntity.ok(Map.of("success", true, "paymentResponse", paymentResponse, "redirectUrl", redirectUrl));
            } //else if ("NAVERPAY".equals(paymentMethod)) {
//                String orderId = "order_" + System.currentTimeMillis();
//                String itemName = "패키지 예약";
//                String paymentResponse = naverPayService.initiatePayment(finalPrice, orderId, itemName);
//                String redirectUrl = "/AccommodationApi/payment/success";
//                return ResponseEntity.ok(Map.of("success", true, "paymentResponse", paymentResponse, "redirectUrl", redirectUrl));
//            }
            System.out.println("여기까지 오나?22222222222222222222222222");
            session.setAttribute("finalPrice", finalPrice); // 최종 금액 세션에 저장
            System.out.println("최종금액"+finalPrice);
            String redirectUrl = "/PackageApi/payment/success";
            return ResponseEntity.ok(Map.of("success", true, "redirectUrl", redirectUrl));
        } else {
        	System.out.println("여기까지 오나?33333333333333333333333333333");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("error", "Payment or Reservation failed"));
        }
    }
    
    // 카카오페이 결제 완료 콜백 처리
    @GetMapping("/payment/success") 
    public ModelAndView paymentSuccess(@RequestParam Map<String, String> params, HttpSession session) {
        // 결제 완료 처리 로직 추가 (예: 결제 검증, DB 업데이트 등)
        System.out.println("결제 금액=================================="+session.getAttribute("finalPrice"));
        ModelAndView mv = new ModelAndView();
        mv.addObject("finalPrice", session.getAttribute("finalPrice")); // 세션에서 최종 금액 가져와서 추가
        mv.setViewName("package/package_reservation_completed");
        return mv;
    }
}
