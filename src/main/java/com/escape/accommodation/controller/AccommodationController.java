package com.escape.accommodation.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.escape.accommodation.domain.Hotel;
import com.escape.accommodation.service.AccommodationService;


@Controller
@RequestMapping("/Accommodation")
public class AccommodationController {
	
	@Autowired
	private AccommodationService accommodationService;
	
	@RequestMapping("/Home")
	public ModelAndView home() {
		
		ModelAndView  mv         =  new ModelAndView();
		mv.setViewName("accommodation/accommodationHome");
		
		return mv; 
	}
	
	@RequestMapping("/Products")
	public ModelAndView products(
					@RequestParam(value = "place", required = false) String place,
	            	@RequestParam(value = "date", required = false) String date,
		            @RequestParam(value = "guest", required = false, defaultValue = "1") int guest) {
		ModelAndView  mv         =  new ModelAndView();
		
		Map<String, Object> params = new HashMap<>();
		params.put("place", place);
		params.put("date", date);
		params.put("guest", guest);
		
		
		List<Hotel> hotels = accommodationService.searchHotels(params);
		List<Map<String, Object>> hotelDetails = accommodationService.getHotelDetails();
		
        Map<Integer, Map<String, Object>> hotelInfoMap = new HashMap<>();
        for (Map<String, Object> detail : hotelDetails) {
            Integer hotelIdx = ((BigDecimal) detail.get("HOTEL_IDX")).intValue(); // 호텔 인덱스 추출
            Integer lowestPrice = ((BigDecimal) detail.get("LOWEST_PRICE")).intValue(); // 최소 가격 추출
            Integer discountRate = detail.get("DISCOUNT_RATE") != null ? ((BigDecimal) detail.get("DISCOUNT_RATE")).intValue() : 0; // 할인율 추출 (없으면 0)
            Integer discountAmount = detail.get("DISCOUNT_AMOUNT") != null ? ((BigDecimal) detail.get("DISCOUNT_AMOUNT")).intValue() : 0; // 할인 금액 추출 (없으면 0)
            
            Map<String, Object> hotelInfo = new HashMap<>(); // 호텔 정보를 담을 맵 생성
            hotelInfo.put("LOWEST_PRICE", lowestPrice);
            hotelInfo.put("DISCOUNT_RATE", discountRate);
            hotelInfo.put("DISCOUNT_AMOUNT", discountAmount);
            hotelInfoMap.put(hotelIdx, hotelInfo);  // hotelInfoMap에 호텔 인덱스를 키로 사용하여 호텔 정보 맵 저장
        }
		
		System.out.println("params========" + params);
		System.out.println("place========" + place);
		System.out.println("date========" + date);
		System.out.println("guest========" + guest);
		System.out.println("hotels========" + hotels);
		
		System.out.println("hotelDetails========" + hotelDetails);
		System.out.println("hotelInfoMap========" + hotelInfoMap);
		
		mv.addObject("hotels", hotels);
		mv.addObject("hotelInfoMap", hotelInfoMap);
		mv.setViewName("accommodation/accommodationProducts");
		
		return mv; 
	}
	
	// Accommodation/Hotel/${hotel.hotel_idx}
	@RequestMapping("/Hotel/{hotel_idx}")
	public ModelAndView hotel(
				@RequestParam(value = "place", required = false) String place,
	        	@RequestParam(value = "date", required = false) String date,
	            @RequestParam(value = "guest", required = false, defaultValue = "1") int guest,
				@PathVariable("hotel_idx") int hotel_idx	) {
		ModelAndView  mv         =  new ModelAndView();
		
		Map<String, Object> params = new HashMap<>();
		params.put("place", place);
		params.put("date", date);
		params.put("guest", guest);
		
		// 데이터베이스에서 이미지 경로를 가져오는 로직
		List<String> imagePaths = accommodationService.getHotelImages(hotel_idx);
		
		System.out.println("imagePaths========" + imagePaths);
		System.out.println("hotel_idx========" + hotel_idx);
		
		mv.addObject("imagePaths", imagePaths);
		mv.setViewName("accommodation/hotel");
		return mv;
	}
}
