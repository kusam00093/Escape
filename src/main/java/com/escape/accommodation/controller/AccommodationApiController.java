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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.escape.accommodation.domain.Payment;
import com.escape.accommodation.domain.RoomReservation;
import com.escape.accommodation.domain.SearchRequest;
import com.escape.accommodation.service.AccommodationApiService;
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

        String date = (String) paymentData.get("date");
        String place = (String) paymentData.get("place");
        int guest = 0;
        int room_idx = 0;
        int reservationPrice = 0;

        // 디버깅 로그 추가
        System.out.println("paymentData: " + paymentData);

        try {
            guest = Integer.parseInt((String) paymentData.get("guest"));
            room_idx = Integer.parseInt((String) paymentData.get("room_idx"));
            reservationPrice = (int) paymentData.get("reservationPrice");
        } catch (ClassCastException | NumberFormatException e) {
            e.printStackTrace(); // 예외 로그 출력
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("error", "Invalid number format"));
        }

        // 디버깅 로그 추가
        System.out.println("Parsed values - guest: " + guest + ", room_idx: " + room_idx + ", reservationPrice: " + reservationPrice);

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

        // RoomReservation 객체 생성 및 설정
        RoomReservation roomReservation = new RoomReservation();
        roomReservation.setUser_idx(user.getUser_idx());
        roomReservation.setRoom_idx(room_idx);
        roomReservation.setReservation_guest(guest);
        roomReservation.setReservation_price(reservationPrice);
        roomReservation.setCheck_in_date(checkInDate);
        roomReservation.setCheck_out_date(checkOutDate);
        roomReservation.setState(2); // 예약 상태를 대기 중으로 설정
        roomReservation.setCreated(LocalDateTime.now());

        boolean reservationSuccess = accommodationApiService.createRoomReservation(roomReservation);

        // 디버깅 로그 추가
        System.out.println("Room reservation success: " + reservationSuccess);

        // Payment 객체 생성 및 설정
        Payment payment = new Payment();
        payment.setUser_idx(user.getUser_idx());
        payment.setPrice(reservationPrice);
        payment.setState(1); // 결제 상태를 완료로 설정
        payment.setCreated(LocalDateTime.now());

        boolean success = accommodationApiService.createRoomReservationAndPayment(roomReservation, payment);
        if (success) {
            return ResponseEntity.ok("Payment processed successfully");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Payment or Reservation failed");
        }
    }
}
