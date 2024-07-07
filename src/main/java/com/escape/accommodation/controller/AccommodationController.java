package com.escape.accommodation.controller;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.Year;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.escape.accommodation.domain.Hotel;
import com.escape.accommodation.domain.Room;
import com.escape.accommodation.service.AccommodationService;
import com.escape.login.domain.Person;
import com.escape.login.domain.Seller;
import com.escape.login.domain.User;
import com.escape.login.mapper.MypageMapper;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/Accommodation")
public class AccommodationController {
	
	@Autowired
	private AccommodationService accommodationService;
	
	@Autowired
	private MypageMapper mypageMapper;
	
	@RequestMapping("/Home")
	public ModelAndView home(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("login");
		
        if (user != null) {
            // 유저의 USER_IDX를 가져와서 SELLER_TB 테이블에서 확인
            Integer userIdx = user.getUser_idx();
            boolean isSeller = accommodationService.isSeller(userIdx);
            
            if (isSeller) {
                mv.setViewName("accommodation/accommodationHomeSeller");
                System.out.println("User is a seller, redirecting to accommodationHomeSeller");
            } else {
                mv.setViewName("accommodation/accommodationHome");
                System.out.println("User is not a seller, redirecting to accommodationHome");
            }
        } else {
            mv.setViewName("accommodation/accommodationHome");
            System.out.println("User is not logged in, redirecting to accommodationHome");
        }
		

        System.out.println("user========" + user);
        System.out.println("user========" + user);
		
		return mv; 
	}
	
	@RequestMapping("/Products")
	public ModelAndView products(
					@RequestParam(value = "place", required = false) String place,
	            	@RequestParam(value = "date", required = false) String date,
		            @RequestParam(value = "guest", required = false, defaultValue = "1") int guest,
		            HttpSession session) {
		ModelAndView  mv         =  new ModelAndView();
		
		Map<String, Object> params = new HashMap<>();
		params.put("place", place);
		params.put("date", date);
		params.put("guest", guest);
		
		
		List<Hotel> hotels = accommodationService.searchHotels(params);
		List<Map<String, Object>> hotelPrice = accommodationService.getHotelPrice();
		
        Map<Integer, Map<String, Object>> hotelPriceMap = new HashMap<>();
        for (Map<String, Object> detail : hotelPrice) {
            Integer hotelIdx = ((BigDecimal) detail.get("HOTEL_IDX")).intValue(); // 호텔 인덱스 추출
            Integer lowestPrice = ((BigDecimal) detail.get("LOWEST_PRICE")).intValue(); // 최소 가격 추출
            Integer discountRate = detail.get("DISCOUNT_RATE") != null ? ((BigDecimal) detail.get("DISCOUNT_RATE")).intValue() : 0; // 할인율 추출 (없으면 0)
            Integer discountAmount = detail.get("DISCOUNT_AMOUNT") != null ? ((BigDecimal) detail.get("DISCOUNT_AMOUNT")).intValue() : 0; // 할인 금액 추출 (없으면 0)
            
            Map<String, Object> hotelInfo = new HashMap<>(); // 호텔 정보를 담을 맵 생성
            hotelInfo.put("LOWEST_PRICE", lowestPrice);
            hotelInfo.put("DISCOUNT_RATE", discountRate);
            hotelInfo.put("DISCOUNT_AMOUNT", discountAmount);
            hotelPriceMap.put(hotelIdx, hotelInfo);  // hotelPriceMap에 호텔 인덱스를 키로 사용하여 호텔 정보 맵 저장
        }
        


        System.out.println("params========" + params);
        System.out.println("place========" + place);
        System.out.println("date========" + date);
        System.out.println("guest========" + guest);
        System.out.println("hotels========" + hotels);
        
        mv.addObject("hotels", hotels);
        mv.addObject("hotelPriceMap", hotelPriceMap);
        
        mv.setViewName("accommodation/accommodationProducts");
        
        return mv;
	}
	
	// Accommodation/Hotel/${hotel.hotel_idx}
	@RequestMapping("/Hotel/{hotel_idx}")
	public ModelAndView hotel(
				@RequestParam(value = "place", required = false) String place,
	        	@RequestParam(value = "date", required = false) String date,
	            @RequestParam(value = "guest", required = false, defaultValue = "1") int guest,
	            @RequestParam(value = "orderBy", required = false, defaultValue = "latest") String orderBy,
				@PathVariable("hotel_idx") int hotel_idx,
				HttpSession session) {
		ModelAndView  mv         =  new ModelAndView();
		
		Map<String, Object> params = new HashMap<>();
		params.put("place", place);
		params.put("date", date);
		params.put("guest", guest);
		params.put("hotel_idx", hotel_idx);
		
		// 데이터베이스에서 이미지 경로를 가져오는 로직
		List<String> imagePaths = accommodationService.getHotelImages(hotel_idx);
		
		
		// 특정 호텔 정보 가져오기
		Hotel hotel = accommodationService.getHotelById(hotel_idx);

	    // 호텔 가격 정보 가져오기
	    List<Map<String, Object>> roomPricesWithDiscounts = accommodationService.getRoomPricesWithDiscounts(hotel_idx);
	    
	    // 특정 호텔에 대한 방 정보 가져오기
	    List<Room> rooms = accommodationService.getRoomsByHotelId(hotel_idx);
	   
	    
	    List<Map<String, Object>> hotelPrice = accommodationService.getHotelPrice();
        Map<Integer, Map<String, Object>> hotelPriceMap = new HashMap<>();
        for (Map<String, Object> detail : hotelPrice) {
            Integer hotelIdx = ((BigDecimal) detail.get("HOTEL_IDX")).intValue(); // 호텔 인덱스 추출
            Integer lowestPrice = ((BigDecimal) detail.get("LOWEST_PRICE")).intValue(); // 최소 가격 추출
            Integer discountRate = detail.get("DISCOUNT_RATE") != null ? ((BigDecimal) detail.get("DISCOUNT_RATE")).intValue() : 0; // 할인율 추출 (없으면 0)
            Integer discountAmount = detail.get("DISCOUNT_AMOUNT") != null ? ((BigDecimal) detail.get("DISCOUNT_AMOUNT")).intValue() : 0; // 할인 금액 추출 (없으면 0)
            
            Map<String, Object> hotelInfo = new HashMap<>(); // 호텔 정보를 담을 맵 생성
            hotelInfo.put("LOWEST_PRICE", lowestPrice);
            hotelInfo.put("DISCOUNT_RATE", discountRate);
            hotelInfo.put("DISCOUNT_AMOUNT", discountAmount);
            hotelPriceMap.put(hotelIdx, hotelInfo);  // hotelPriceMap에 호텔 인덱스를 키로 사용하여 호텔 정보 맵 저장
        }
	    
        // 방 정보에 할인 가격 추가하기 및 최저 가격 계산
        int lowestPrice = Integer.MAX_VALUE;
	    for (Room room : rooms) {
	        for (Map<String, Object> roomPriceInfo : roomPricesWithDiscounts) {
	            if (room.getRoom_idx() == ((BigDecimal) roomPriceInfo.get("ROOM_IDX")).intValue()) {
	                int discountRate = roomPriceInfo.get("DISCOUNT_RATE") != null ? ((BigDecimal) roomPriceInfo.get("DISCOUNT_RATE")).intValue() : 0;
	                int discountAmount = roomPriceInfo.get("DISCOUNT_AMOUNT") != null ? ((BigDecimal) roomPriceInfo.get("DISCOUNT_AMOUNT")).intValue() : 0;
	                int discountedPrice = roomPriceInfo.get("DISCOUNTED_PRICE") != null ? ((BigDecimal) roomPriceInfo.get("DISCOUNTED_PRICE")).intValue() : room.getPrice();
	                
	                room.setDiscount_rate(discountRate);
	                room.setDiscount_amount(discountAmount);
	                room.setDiscountedPrice(discountedPrice);
	                // 최저 가격 계산
	                if (discountedPrice < lowestPrice) {
	                    lowestPrice = discountedPrice;
	                }
	                break;
	            }
	            
	        }
	    }
	    

        // 평점 정보 가져오기
        Map<String, Object> rateInfo = accommodationService.getAverageRateAndCount(hotel_idx);
        
        // 평점별 인원 수 가져오기
        Map<Integer, Integer> rateDistribution = accommodationService.getRateDistribution(hotel_idx);
        
        // 호텔 편의시설 정보 가져오기
        List<Map<String, Object>> hotelFacilities = accommodationService.getHotelFacilities(hotel_idx);
        
        // 후기 옵션 정보 가져오기
        List<Map<String, Object>> topReviewOptions = accommodationService.getTopReviewOptions(hotel_idx);
        
        // 리뷰 정보 가져오기
        List<Map<String, Object>> reviews = accommodationService.getReviewsWithDetails(hotel_idx);
        
		System.out.println("params========" + params);
		System.out.println("imagePaths========" + imagePaths);
		System.out.println("hotel_idx========" + hotel_idx);
		System.out.println("hotel========" + hotel);
		System.out.println("roomPricesWithDiscounts========" + roomPricesWithDiscounts);
		System.out.println("hotelFacilities========" + hotelFacilities);
		System.out.println("date========" + date);
		System.out.println("rooms========" + rooms);
		System.out.println("rateInfo========" + rateInfo);
		System.out.println("rateDistribution========" + rateDistribution);
		System.out.println("topReviewOptions========" + topReviewOptions);
		System.out.println("reviews========" + reviews);
		
		mv.addObject("imagePaths", imagePaths);
        mv.addObject("hotel", hotel);
        mv.addObject("roomPricesWithDiscounts", roomPricesWithDiscounts);
        mv.addObject("hotelFacilities", hotelFacilities);
        mv.addObject("date", date);
        mv.addObject("hotelPriceMap", hotelPriceMap);
        mv.addObject("rooms", rooms);
        mv.addObject("lowestPrice", lowestPrice);
        mv.addObject("rateInfo", rateInfo);
        mv.addObject("reviews", reviews);
        mv.addObject("rateDistribution", rateDistribution);
        mv.addObject("topReviewOptions", topReviewOptions);
		mv.setViewName("accommodation/hotel");
		return mv;
	}
	
//	http://localhost:9089/Accommodation/RoomOrder/${room_idx}
	@RequestMapping("/RoomOrder/{room_idx}")
	public ModelAndView roomOrder(
				@RequestParam(value = "place", required = false) String place,
	        	@RequestParam(value = "date", required = false) String date,
	            @RequestParam(value = "guest", required = false, defaultValue = "1") int guest,
	            @RequestParam(value = "hotel_idx", required = true) int hotel_idx,  // 추가된 부분
	            @PathVariable("room_idx") int room_idx,
				HttpSession session) {
		ModelAndView  mv         =  new ModelAndView();
 
	   	User user = (User) session.getAttribute("login");
        Person person = mypageMapper.getPersonByuser_idx(user.getUser_idx());
		
        Integer point = accommodationService.getPointsByPersonIdx(person.getPerson_idx());
        
		Map<String, Object> params = new HashMap<>();
		params.put("place", place);
		params.put("date", date);
		params.put("guest", guest);
		params.put("hotel_idx", hotel_idx);

		// 데이터베이스에서 이미지 경로를 가져오는 로직
		List<String> imagePaths = accommodationService.getHotelImages(hotel_idx);
		
		
		// 특정 호텔 정보 가져오기
		Hotel hotel = accommodationService.getHotelById(hotel_idx);

		 // 호텔 가격 정보 가져오기
        List<Map<String, Object>> hotelPrice = accommodationService.getHotelPrice();
        
        Map<Integer, Map<String, Object>> hotelPriceMap = new HashMap<>();
        for (Map<String, Object> detail : hotelPrice) {
            Integer hotelIdx = ((BigDecimal) detail.get("HOTEL_IDX")).intValue(); // 호텔 인덱스 추출
            Integer lowestPrice = ((BigDecimal) detail.get("LOWEST_PRICE")).intValue(); // 최소 가격 추출
            Integer discountRate = detail.get("DISCOUNT_RATE") != null ? ((BigDecimal) detail.get("DISCOUNT_RATE")).intValue() : 0; // 할인율 추출 (없으면 0)
            Integer discountAmount = detail.get("DISCOUNT_AMOUNT") != null ? ((BigDecimal) detail.get("DISCOUNT_AMOUNT")).intValue() : 0; // 할인 금액 추출 (없으면 0)
            
            Map<String, Object> hotelInfo = new HashMap<>(); // 호텔 정보를 담을 맵 생성
            hotelInfo.put("LOWEST_PRICE", lowestPrice);
            hotelInfo.put("DISCOUNT_RATE", discountRate);
            hotelInfo.put("DISCOUNT_AMOUNT", discountAmount);
            hotelPriceMap.put(hotelIdx, hotelInfo);  // hotelPriceMap에 호텔 인덱스를 키로 사용하여 호텔 정보 맵 저장
        }
        
        // 호텔 편의시설 정보 가져오기
        List<Map<String, Object>> hotelFacilities = accommodationService.getHotelFacilities(hotel_idx);
        
        // 특정 방 정보 가져오기
        Room room = accommodationService.getRoomById(room_idx);
        
        // 날짜 계산
        String[] dateSplit = date.split("~");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("M월 d일", Locale.KOREAN);

        // "7월 9일" 형식의 문자열을 파싱하기 위해 월과 일을 숫자로 변환
        String checkInDateString = dateSplit[0].trim().split("\\(")[0].trim();
        String checkOutDateString = dateSplit[1].trim().split("\\(")[0].trim();
        
        // 현재 연도 가져오기
        int currentYear = Year.now().getValue();
        
        // 날짜 문자열 파싱
        LocalDate checkInDate = LocalDate.parse(checkInDateString + " " + currentYear, DateTimeFormatter.ofPattern("M월 d일 yyyy", Locale.KOREAN));
        LocalDate checkOutDate = LocalDate.parse(checkOutDateString + " " + currentYear, DateTimeFormatter.ofPattern("M월 d일 yyyy", Locale.KOREAN));
        long totalNights = ChronoUnit.DAYS.between(checkInDate, checkOutDate);
		
        // 체크인 날짜로부터 5일 전 계산
        LocalDate refundPolicyDate = checkInDate.minusDays(5);
        String refundPolicyDateString = refundPolicyDate.format(DateTimeFormatter.ofPattern("yy.MM.dd 00시 00분", Locale.KOREAN));
        
		System.out.println("params========" + params);
		System.out.println("imagePaths========" + imagePaths);
		System.out.println("hotel========" + hotel);
		System.out.println("hotelPriceMap========" + hotelPriceMap);
		System.out.println("hotelFacilities========" + hotelFacilities);
		System.out.println("room========" + room);
		
		
		System.out.println("checkInDateString========" + checkInDateString);
		System.out.println("checkOutDateString========" + checkOutDateString);
		System.out.println("checkInDate========" + checkInDate);
		System.out.println("checkOutDate========" + checkOutDate);
		System.out.println("totalNights========" + totalNights);
		System.out.println("currentYear========" + currentYear);

        System.out.println("user========" + user);
        System.out.println("person========" + person);
        System.out.println("point========" + point);
        
        System.out.println("refundPolicyDate========" + refundPolicyDateString);
        
        mv.addObject("refundPolicyDate", refundPolicyDateString);
        mv.addObject("user", user);
        mv.addObject("person", person);
        mv.addObject("point", point);
		mv.addObject("imagePaths", imagePaths);
        mv.addObject("hotel", hotel);
        mv.addObject("hotelPriceMap", hotelPriceMap);
        mv.addObject("hotelFacilities", hotelFacilities);
        mv.addObject("date", date);
        mv.addObject("room", room);
        mv.addObject("checkInDate", checkInDate.format(formatter));
        mv.addObject("checkOutDate", checkOutDate.format(formatter));
        mv.addObject("totalNights", totalNights);
		mv.setViewName("accommodation/roomOrder");
		return mv;
	}
	
	@RequestMapping("/RoomOrderCompleted")
	public ModelAndView RoomOrderCompleted(
				HttpSession session) {
		ModelAndView  mv         =  new ModelAndView();
 
	   	User user = (User) session.getAttribute("login");
        Person person = mypageMapper.getPersonByuser_idx(user.getUser_idx());
		
        int finalPrice = (int) session.getAttribute("finalPrice"); // 세션에서 최종 금액 가져오기
       
        mv.addObject("finalPrice",finalPrice);
    	mv.setViewName("accommodation/roomOrderCompleted");

		return mv;
	}
	
	@RequestMapping("/MyPageBuy")
	public ModelAndView myPageBuy(
			HttpSession session) {
		
	   	User user = (User) session.getAttribute("login");
        Person person = mypageMapper.getPersonByuser_idx(user.getUser_idx());
		
		ModelAndView  mv         =  new ModelAndView();
		mv.setViewName("redirect:/mypagebuy");
		
		return mv; 
	}
	
	// Accommodation/HotelSeller
	@RequestMapping("/HotelSeller")
	public ModelAndView hotelSeller(
			HttpSession session) {
		
	    User user = (User) session.getAttribute("login");
	    if (user != null) {
	        // SELLER_TB 테이블에서 해당 유저가 셀러인지 확인
	        boolean isSeller = accommodationService.isSeller(user.getUser_idx());
	        if (isSeller) {
	            Seller seller = mypageMapper.getSellerByuser_idx(user.getUser_idx());
	            
	            ModelAndView mv = new ModelAndView();
	            mv.addObject("seller", seller); // 필요한 데이터를 추가
	            mv.setViewName("accommodation/hotelSeller");
	            return mv;
	        } else {
	            // 셀러가 아닌 경우 다른 페이지로 리다이렉트 (예: 접근 권한 없음 페이지)
	            return new ModelAndView("redirect:/access-denied");
	        }
	    } else {
	        // 로그인이 안 된 경우 로그인 페이지로 리다이렉트
	        return new ModelAndView("redirect:/personlogin");
	    }
	}
}
