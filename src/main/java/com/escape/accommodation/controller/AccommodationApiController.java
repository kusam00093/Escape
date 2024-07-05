package com.escape.accommodation.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.escape.accommodation.domain.Payment;
import com.escape.accommodation.domain.RoomReservation;
import com.escape.accommodation.domain.SearchRequest;
import com.escape.accommodation.service.AccommodationApiService;
import com.escape.accommodation.service.KakaoPayService;
import com.escape.accommodation.service.NaverPayService;
import com.escape.login.domain.Person;
import com.escape.login.domain.User;
import com.escape.login.mapper.MypageMapper;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/AccommodationApi")
public class AccommodationApiController {
    
    @Autowired
    private AccommodationApiService accommodationApiService;
    @Autowired
    private MypageMapper mypageMapper;
    @Autowired
    @Qualifier("hotelKakaoPayService")
    private KakaoPayService kakaoPayService;
    @Autowired
    @Qualifier("hotelNaverPayService")
    private NaverPayService naverPayService;
    
    // /AccommodationApi/Search
    @PostMapping("/Search")
    public List<SearchResult> search(@RequestBody SearchRequest request) {
        return accommodationApiService.search(request.getQuery());
    }
    
    @PostMapping("/usePoints")
    public ResponseEntity<String> usePoints(@RequestParam int pointsToUse, HttpSession session) {
        User user = (User) session.getAttribute("login");
        Person person = mypageMapper.getPersonByuser_idx(user.getUser_idx());
        
        System.out.println("user========" + user);
        System.out.println("person========" + person);

        boolean success = accommodationApiService.usePoints(person.getPerson_idx(), pointsToUse);
        if (success) {
            return ResponseEntity.ok("Points used successfully");
        } else {
            return ResponseEntity.status(HttpServletResponse.SC_BAD_REQUEST).body("Insufficient points");
        }
    }
    
    @PostMapping("/Payment")
    public ResponseEntity<?> processPayment(@RequestBody Map<String, Object> paymentData, HttpSession session) {
        User user = (User) session.getAttribute("login");
        if (user == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("error", "Unauthorized"));
        }

        // 디버깅 로그 추가
        System.out.println("paymentData: " + paymentData);

        String date = (String) paymentData.get("date");
        String place = (String) paymentData.get("place");
        int guest;
        int room_idx;
        int reservationPrice;
        int finalPrice;
        int pointsToUse;
        String paymentMethod;
        
        try {
            guest = Integer.parseInt(paymentData.get("guest").toString());
            room_idx = Integer.parseInt(paymentData.get("room_idx").toString());
            reservationPrice = Integer.parseInt(paymentData.get("reservationPrice").toString());
            finalPrice = Integer.parseInt(paymentData.get("finalPrice").toString());
            pointsToUse = Integer.parseInt(paymentData.get("pointsToUse").toString());
            paymentMethod = (String) paymentData.get("paymentMethod");
        } catch (ClassCastException | NumberFormatException e) {
            e.printStackTrace(); // 예외 로그 출력
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("error", "Invalid number format"));
        }

        // 디버깅 로그 추가
        System.out.println("Parsed values - guest: " + guest + ", room_idx: " + room_idx + ", reservationPrice: " + reservationPrice + ", finalPrice: " + finalPrice);

        // 날짜 파싱 로직
        String[] dateSplit = date.split("~");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("M월 d일 yyyy", Locale.KOREAN);
        
        LocalDate checkInDate;
        LocalDate checkOutDate;
        
        try {
            String checkInDateString = dateSplit[0].trim().split("\\(")[0].trim();
            String checkOutDateString = dateSplit[1].trim().split("\\(")[0].trim();
            int currentYear = LocalDate.now().getYear();

            checkInDate = LocalDate.parse(checkInDateString + " " + currentYear, formatter);
            checkOutDate = LocalDate.parse(checkOutDateString + " " + currentYear, formatter);
        } catch (DateTimeParseException e) {
            e.printStackTrace(); // 예외 로그 출력
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("error", "Invalid date format"));
        }

        // 디버깅 로그 추가
        System.out.println("Parsed dates - checkInDate: " + checkInDate + ", checkOutDate: " + checkOutDate);

        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String checkInDateFormatted = checkInDate.format(dateFormatter);
        String checkOutDateFormatted = checkOutDate.format(dateFormatter);
        
        // RoomReservation 객체 생성 및 설정
        RoomReservation roomReservation = new RoomReservation();
        roomReservation.setUser_idx(user.getUser_idx());
        roomReservation.setRoom_idx(room_idx);
        roomReservation.setReservation_guest(guest);
        roomReservation.setReservation_price(finalPrice);
        roomReservation.setCheck_in_date(checkInDateFormatted); // 문자열로 설정
        roomReservation.setCheck_out_date(checkOutDateFormatted); // 문자열로 설정
        roomReservation.setState(2); // 예약 상태를 대기 중으로 설정
        roomReservation.setCreated(LocalDateTime.now());

        Payment payment = new Payment();
        payment.setUser_idx(user.getUser_idx());
        payment.setPrice(finalPrice);
        payment.setState(1); // 결제 상태를 완료로 설정
        payment.setCreated(LocalDateTime.now());

        boolean success = accommodationApiService.createRoomReservationAndPayment(roomReservation, payment);
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
                String orderId = "order_" + System.currentTimeMillis();
                String itemName = "호텔 예약";
                String paymentResponse = kakaoPayService.initiatePayment(finalPrice, orderId, itemName);
                return ResponseEntity.ok(Map.of("success", true, "paymentResponse", paymentResponse));
            } else if ("NAVERPAY".equals(paymentMethod)) {
                String orderId = "order_" + System.currentTimeMillis();
                String itemName = "호텔 예약";
                String paymentResponse = naverPayService.initiatePayment(finalPrice, orderId, itemName);
                return ResponseEntity.ok(Map.of("success", true, "paymentResponse", paymentResponse));
            }
            
            session.setAttribute("finalPrice", finalPrice); // 최종 금액 세션에 저장
            String redirectUrl = "/Accommodation/RoomOrderCompleted";
            return ResponseEntity.ok(Map.of("success", true, "redirectUrl", redirectUrl));
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("error", "Payment or Reservation failed"));
        }
    }
    
    // 카카오페이 결제 완료 콜백 처리
    @GetMapping("/payment/success")
    public ModelAndView paymentSuccess(@RequestParam Map<String, String> params) {
        // 결제 완료 처리 로직 추가 (예: 결제 검증, DB 업데이트 등)
        
        ModelAndView mv = new ModelAndView();
        mv.setViewName("accommodation/roomOrderCompleted");
        return mv;
    }
}
