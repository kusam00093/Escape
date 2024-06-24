package com.escape.airplane.controller;

import java.math.BigDecimal;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.escape.airplane.domain.AirplaneSearchVo;
import com.escape.airplane.domain.AirplaneVo;
import com.escape.airplane.domain.AirportVo;
import com.escape.airplane.domain.CityVo;
import com.escape.airplane.mapper.AirplaneMapper;
import com.escape.airplane.service.FilterService;
import com.escape.kakao.domain.PaymentVo;
import com.escape.kakao.service.KakaoPayService;
import com.escape.login.domain.User;
import com.escape.airplane.model.Flight;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/Airplane")
public class AirplaneController {

	@Autowired
	private AirplaneMapper airplaneMapper;
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Autowired
    private FilterService filterService;
	
	@RequestMapping("/Main")
	public ModelAndView main( AirplaneVo airplaneVo, HttpServletRequest request, User user ) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("airplane/airplanemain");
		return mv;
		
	}
	
	@RequestMapping("/Search")
    @ResponseBody
    public ModelAndView search(
            @RequestParam Map<String, String> params,
            @RequestParam(value = "depDate2[]", required = false) List<String> depDates2,
            AirplaneVo airplaneVo,
            AirplaneSearchVo airplaneSearchVo,
            AirportVo airportVo,
            CityVo cityVo) {

		String depCity1 = params.get("depCity1");
        String depCity2 = params.get("ariCity1");
        String ariCity1 = params.get("ariCity1");
        String ariCity2 = params.get("depCity1");
        String depCityCode1 = params.get("depCityCode1");
        String depCityCode2 = params.get("ariCityCode1");
        String ariCityCode1 = params.get("ariCityCode1");
        String ariCityCode2 = params.get("depCityCode1");
        String depDate1 = params.get("depDate1");
        String initform = params.get("initform");

        String seatClassStr = params.get("seatClassStr");
        String seatClass = params.get("seatClass");
        int stype = Integer.parseInt(seatClass);
        
        String adultCountStr = params.get("adultCount");
        int adultCount = Integer.parseInt(adultCountStr);
        String childCountStr = params.get("childCount");
        int childCount = Integer.parseInt(childCountStr);
        String infantCountStr = params.get("infantCount");
        int infantCount = Integer.parseInt(infantCountStr);

        ModelAndView mv = new ModelAndView();
        List<Map<String, Object>> airSearchList = new ArrayList<>();

        // 시간대 필터링을 위한 파라미터 추가
        String selectedTimeCategory = params.get("timeCategory");
        Set<String> uncheckedCategories = getUncheckedCategories(params); // 새로운 메서드 호출로 카테고리 초기화
        
        if ("RT".equals(initform) && depDates2 != null) {
            processRoundTrip(depCity1, ariCity1, depCity2, ariCity2, depDates2, stype, adultCount, childCount, infantCount, airSearchList, mv, uncheckedCategories, selectedTimeCategory);
        } else {
            processOneWay(depCity1, ariCity1, depDate1, stype, adultCount, childCount, infantCount, airSearchList, mv, uncheckedCategories, selectedTimeCategory);
        }

        mv.addObject("airSearchList", airSearchList);
        mv.addObject("seatClassStr", params.get("seatClassStr"));
        mv.addObject("seatClass", stype);
        mv.addObject("adultCount", adultCount);
        mv.addObject("childCount", childCount);
        mv.addObject("infantCount", infantCount);
        mv.addObject("initform", initform);
        mv.addObject("selectedTimeCategory", selectedTimeCategory); // 선택된 시간대 추가
        mv.setViewName("airplane/airplanesearch");
        return mv;
    }
	
	// String을 java.sql.Time으로 변환하는 메서드 추가
	private Time convertStringToTime(String timeString) throws ParseException {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
	    long ms = dateFormat.parse(timeString).getTime();
	    return new Time(ms);
	}
	
	//private void processRoundTrip(String depCity1, String ariCity1, String depCity2, String ariCity2, List<String> depDates2, int stype, int adultCount, int childCount, int infantCount, List<Map<String, Object>> airSearchList, ModelAndView mv, Set<String> uncheckedCategories) {
	private void processRoundTrip(String depCity1, String ariCity1, String depCity2, String ariCity2, List<String> depDates2, int stype, int adultCount, int childCount, int infantCount, List<Map<String, Object>> airSearchList, ModelAndView mv, Set<String> uncheckedCategories, String selectedTimeCategory) {
	    List<CityVo> departureLoc1 = airplaneMapper.getDepartureInfo(depCity1);
        int departure_loc1 = departureLoc1.get(0).getCity_idx();
        List<CityVo> arrivalLoc1 = airplaneMapper.getArrivalInfo(ariCity1);
        int arrival_loc1 = arrivalLoc1.get(0).getCity_idx();
        List<CityVo> departureLoc2 = airplaneMapper.getDepartureInfo(depCity2);
        int departure_loc2 = departureLoc2.get(0).getCity_idx();
        List<CityVo> arrivalLoc2 = airplaneMapper.getArrivalInfo(ariCity2);
        int arrival_loc2 = arrivalLoc2.get(0).getCity_idx();

        for (String depDate2 : depDates2) {
            List<Map<String, Object>> tempList;
            if (depDate2.equals(depDates2.get(0))) {
                tempList = airplaneMapper.getTimeList(depDate2, departure_loc1, arrival_loc1, stype);
            } else {
                tempList = airplaneMapper.getTimeList(depDate2, departure_loc2, arrival_loc2, stype);
            }
            for (Map<String, Object> flight : tempList) {
                String category = (String) flight.get("CATEGORY"); // 카테고리 필드 확인
                if (shouldRemoveFlight(category, uncheckedCategories)) {
                    continue; // 이 비행기 건너뜀
                }
                // 시간대 필터링
//                Time startTime = (Time) flight.get("START_TIME"); // 출발 시간 필드 확인
//                if (!getTimeCategory(startTime).equals(selectedTimeCategory)) {
//                    continue; // 선택된 시간대와 일치하지 않는 비행기 건너뜀
//                }
                calculatePrice(tempList, adultCount, childCount, infantCount, stype);
                airSearchList.addAll(tempList);
            }
        }

        calculateDuration(airSearchList);
        groupRoundTrips(airSearchList, mv);
        
        // 왕복 비행기 리스트를 가져오는 로직 (예시)
        List<Map<String, Object>> outboundFlights = getFlights(depCity1, ariCity1, depDates2.get(0), stype, adultCount, childCount, infantCount);
        List<Map<String, Object>> returnFlights = getFlights(depCity2, ariCity2, depDates2.get(1), stype, adultCount, childCount, infantCount);

        // 필터링된 왕복 비행기 리스트를 저장할 리스트
        List<Map<String, Object>> filteredOutboundFlights = new ArrayList<>();
        List<Map<String, Object>> filteredReturnFlights = new ArrayList<>();

        // 출발편 필터링
        for (Map<String, Object> flight : outboundFlights) {
            String startTimeString = (String) flight.get("START_TIME"); // 출발 시간 필드 확인
            try {
                Time startTime = convertStringToTime(startTimeString); // 문자열을 Time으로 변환
                if (!getTimeCategory(startTime).equals(selectedTimeCategory)) {
                    continue; // 선택된 시간대와 일치하지 않는 비행기 건너뜀
                }
            } catch (ParseException e) {
                e.printStackTrace();
                continue; // 시간 변환에 실패한 경우 해당 비행기 건너뜀
            }

            // 필터링 조건을 통과한 비행기만 추가
            filteredOutboundFlights.add(flight);
            System.out.println("===== Search === filteredOutboundFlights: " + filteredOutboundFlights);
        }

        // 도착편 필터링
        for (Map<String, Object> flight : returnFlights) {
            String startTimeString = (String) flight.get("START_TIME"); // 출발 시간 필드 확인
            try {
                Time startTime = convertStringToTime(startTimeString); // 문자열을 Time으로 변환
                if (!getTimeCategory(startTime).equals(selectedTimeCategory)) {
                    continue; // 선택된 시간대와 일치하지 않는 비행기 건너뜀
                }
            } catch (ParseException e) {
                e.printStackTrace();
                continue; // 시간 변환에 실패한 경우 해당 비행기 건너뜀
            }

            // 필터링 조건을 통과한 비행기만 추가
            filteredReturnFlights.add(flight);
        }

        // 필터링된 왕복 비행기 리스트를 최종 리스트에 추가
        airSearchList.addAll(filteredOutboundFlights);
        airSearchList.addAll(filteredReturnFlights);
        //System.out.println("===== Search === airSearchList: " + airSearchList);
        
    }
	
	//private void processOneWay(String depCity1, String ariCity1, String depDate1, int stype, int adultCount, int childCount, int infantCount, List<Map<String, Object>> airSearchList, ModelAndView mv, Set<String> uncheckedCategories) {
	private void processOneWay(String depCity1, String ariCity1, String depDate1, int stype, int adultCount, int childCount, int infantCount, List<Map<String, Object>> airSearchList, ModelAndView mv, Set<String> uncheckedCategories, String selectedTimeCategory) {
	    List<CityVo> departureLoc1 = airplaneMapper.getDepartureInfo(depCity1);
        int departure_loc1 = departureLoc1.get(0).getCity_idx();
        List<CityVo> arrivalLoc1 = airplaneMapper.getArrivalInfo(ariCity1);
        int arrival_loc1 = arrivalLoc1.get(0).getCity_idx();
        
        List<Map<String, Object>> tempList = airplaneMapper.getTimeList(depDate1, departure_loc1, arrival_loc1, stype);
        for (Map<String, Object> flight : tempList) {
            String category = (String) flight.get("CATEGORY"); // 카테고리 필드 확인
            if (shouldRemoveFlight(category, uncheckedCategories)) {
                continue; // 이 비행기 건너뜀
            }
            // 시간대 필터링
//            Time startTime = (Time) flight.get("START_TIME"); // 출발 시간 필드 확인
//            if (!getTimeCategory(startTime).equals(selectedTimeCategory)) {
//                continue; // 선택된 시간대와 일치하지 않는 비행기 건너뜀
//            }
            calculatePrice(tempList, adultCount, childCount, infantCount, stype);
            airSearchList.addAll(tempList);
        }
        calculateDuration(airSearchList);
        groupOneWays(airSearchList, mv);
        
        // 비행기 리스트를 가져오는 로직 (예시)
        List<Map<String, Object>> flights = getFlights(depCity1, ariCity1, depDate1, stype, adultCount, childCount, infantCount);

        for (Map<String, Object> flight : flights) {
            String startTimeString = (String) flight.get("START_TIME"); // 출발 시간 필드 확인
            try {
                Time startTime = convertStringToTime(startTimeString); // 문자열을 Time으로 변환
                if (!getTimeCategory(startTime).equals(selectedTimeCategory)) {
                    continue; // 선택된 시간대와 일치하지 않는 비행기 건너뜀
                }
            } catch (ParseException e) {
                e.printStackTrace();
                continue; // 시간 변환에 실패한 경우 해당 비행기 건너뜀
            }

            // 필터링 조건을 통과한 비행기만 추가
            airSearchList.add(flight);
        }
        
    }
	
	// getFlights 메서드 예시 (비행기 리스트를 가져오는 로직)
	private List<Map<String, Object>> getFlights(String depCity1, String ariCity1, String depDate1, int stype, int adultCount, int childCount, int infantCount) {
	    // 비행기 리스트를 가져오는 로직 구현 (예시)
	    return new ArrayList<>();
	}
	
	// 소요시간 계산
	private void calculateDuration(List<Map<String, Object>> flights) {
        for (Map<String, Object> flight : flights) {
            String startTime = flight.get("START_TIME").toString();
            String endTime = flight.get("END_TIME").toString();
            Duration duration = Duration.between(LocalTime.parse(startTime), LocalTime.parse(endTime));
            flight.put("DURATIONHOUR", String.valueOf(duration.toHours()));
            flight.put("DURATIONMINUTE", String.valueOf(duration.toMinutes() % 60));
        }
    }
    
//    private void calculateDuration(List<Map<String, Object>> flights) {
//        for (Map<String, Object> flight : flights) {
//            Object startTimeObj = flight.get("START_TIME");
//            String startTime = startTimeObj != null ? startTimeObj.toString() : null;
//            Object endTimeObj = flight.get("END_TIME");
//            String endTime = endTimeObj != null ? endTimeObj.toString() : null;
//            
//            if (startTime != null && endTime != null) {
//                Duration duration = Duration.between(LocalTime.parse(startTime), LocalTime.parse(endTime));
//                Long durationHour = duration.toHours();
//                Long durationMinutes = duration.toMinutes() % 60;
//                
//                flight.put("DURATIONHOUR", durationHour.toString());
//                flight.put("DURATIONMINUTE", durationMinutes.toString());
//            }
//        }
//    }
    
    // 가격 계산
    private void calculatePrice(List<Map<String, Object>> flights, int adultCount, int childCount, int infantCount, int stype) {
    	
    	int adultPrice = 0;
        int childPrice = 0;
        int infantPrice = 0;
        int price = 0;
    	
        for (Map<String, Object> flight : flights) {
            
            System.out.println("===== calculatePrice === flights0: " + flights);
            System.out.println("===== calculatePrice === flight0: " + flight);
            System.out.println("===== calculatePrice === adultCount0: " + adultCount);
            System.out.println("===== calculatePrice === childCount0: " + childCount);
            System.out.println("===== calculatePrice === infantCount0: " + infantCount);
            System.out.println("===== calculatePrice === stype0: " + stype);
            
            BigDecimal airplaneTimeIdx = (BigDecimal) flight.get("AIRPLANE_TIME_IDX");
            BigDecimal ptypeIdx = (BigDecimal) flight.get("PTYPE_IDX");
            BigDecimal priceValue = (BigDecimal) flight.get("PRICE");
            
            System.out.println("===== calculatePrice === airplaneTimeIdx0: " + airplaneTimeIdx);
            System.out.println("===== calculatePrice === ptypeIdx0: " + ptypeIdx);
            System.out.println("===== calculatePrice === priceValue0: " + priceValue);

            int priceidx = airplaneMapper.getPriceInfo(airplaneTimeIdx, ptypeIdx, stype);
            System.out.println("===== calculatePrice === priceidx: " + priceidx);
            
            System.out.println("===============valueOf(1): " + ptypeIdx.equals(BigDecimal.valueOf(1)));
            System.out.println("===============valueOf(2): " + ptypeIdx.equals(BigDecimal.valueOf(2)));
            System.out.println("===============valueOf(3): " + ptypeIdx.equals(BigDecimal.valueOf(3)));
            
            
            if (ptypeIdx.equals(BigDecimal.valueOf(1))) {
            	adultPrice = priceValue.intValue() * adultCount;
	        }
	      
	        if (ptypeIdx.equals(BigDecimal.valueOf(2))) {
	        	childPrice = priceValue.intValue() * childCount;
	        }
	      
	        if (ptypeIdx.equals(BigDecimal.valueOf(3))) {
	        	infantPrice = priceValue.intValue() * infantCount;
	        }

	        flight.put("ADULT_PRICE", adultPrice);
	        flight.put("CHILD_PRICE", childPrice);
	        flight.put("INFANT_PRICE", infantPrice);
            
            price = adultPrice + childPrice + infantPrice;
            flight.put("TOTAL_PRICE", price);

            System.out.println("===== calculatePrice === adultPrice: " + adultPrice);
            System.out.println("===== calculatePrice === childPrice: " + childPrice);
            System.out.println("===== calculatePrice === infantPrice: " + infantPrice);
            System.out.println("===== calculatePrice === price: " + price);
            System.out.println("===== calculatePrice === flight: " + flight);
            
        }
        
    }
    
    private void groupRoundTrips(List<Map<String, Object>> airSearchList, ModelAndView mv) {
        Map<Integer, List<Map<String, Object>>> groupedFlights = airSearchList.stream().collect(Collectors.groupingBy(flight -> ((BigDecimal) flight.get("AIRPLANE_IDX")).intValue()));
        List<List<Map<String, Object>>> roundTripFlights = new ArrayList<>();
        List<Integer> roundTripPrices = new ArrayList<>();

        for (List<Map<String, Object>> flights : groupedFlights.values()) {
            List<Map<String, Object>> roundTrip = new ArrayList<>();
            int totalPrice = 0;
            List<Map<String, Object>> filteredFlights = flights.stream().filter(flight -> BigDecimal.valueOf(3).equals(flight.get("PTYPE_IDX"))).collect(Collectors.toList());
            for (Map<String, Object> flight : filteredFlights) {
                if (roundTrip.size() == 2) break;
                if (roundTrip.isEmpty()) {
                    roundTrip.add(flight);
                    totalPrice += (int) flight.get("TOTAL_PRICE");
                } else {
                    Map<String, Object> firstFlight = roundTrip.get(0);
                    if (firstFlight.get("DEPARTURE_LOC").equals(flight.get("ARRIVAL_LOC")) && firstFlight.get("ARRIVAL_LOC").equals(flight.get("DEPARTURE_LOC"))) {
                        roundTrip.add(flight);
                        totalPrice += (int) flight.get("TOTAL_PRICE");
                    }
                }
            }
            if (roundTrip.size() == 2) {
                roundTripFlights.add(roundTrip);
                roundTripPrices.add(totalPrice);
            }
        }

        mv.addObject("roundTripFlights", roundTripFlights);
        mv.addObject("roundTripPrices", roundTripPrices);
    }
    
    private void groupOneWays(List<Map<String, Object>> airSearchList, ModelAndView mv) {
        Map<Integer, List<Map<String, Object>>> groupedFlights = airSearchList.stream().collect(Collectors.groupingBy(flight -> ((BigDecimal) flight.get("AIRPLANE_IDX")).intValue()));
        List<List<Map<String, Object>>> oneWayFlights = new ArrayList<>();
        List<Integer> oneWayPrices = new ArrayList<>();

        for (List<Map<String, Object>> flights : groupedFlights.values()) {
            List<Map<String, Object>> oneWay = new ArrayList<>();
            int totalPrice = 0;
            for (Map<String, Object> flight : flights) {
                if (oneWay.isEmpty() && BigDecimal.valueOf(1).equals(flight.get("PTYPE_IDX"))) {
                    oneWay.add(flight);
                    totalPrice += (int) flight.get("TOTAL_PRICE");
                }
            }
            if (!oneWay.isEmpty()) {
                oneWayFlights.add(oneWay);
                oneWayPrices.add(totalPrice);
            }
        }

        mv.addObject("oneWayFlights", oneWayFlights);
        mv.addObject("oneWayPrices", oneWayPrices);
    }
	
	@RequestMapping("/AirplanePay")
	public ModelAndView airplanepay(
				@RequestParam Map<Object, Object> params
			) {
		
		System.out.println("===== AirplanePay === params: " + params);
		
		int user_idx = airplaneMapper.getUserIdx( params.get("userId") );
		System.out.println("===== Airplane/AirplanePay === user_idx: " + user_idx);
		
		String orderId = (String) params.get("orderId");
		String userId = (String) params.get("userId");
		String itemName = (String) params.get("itemName");
		String seatClass = (String) params.get("seatClass");
		String adultCount = (String) params.get("adultCount");
		String childCount = (String) params.get("childCount");
		String infantCount = (String) params.get("infantCount");
		int totalCount = Integer.parseInt( adultCount ) + Integer.parseInt( childCount ) + Integer.parseInt( infantCount );
		String adultPrice = (String) params.get("adultPrice");
		String childPrice = (String) params.get("childPrice");
		String infantPrice = (String) params.get("infantPrice");
		String totalPrice = (String) params.get("totalPrice");

		System.out.println("===== AirplanePay === orderId: " + orderId);
		System.out.println("===== AirplanePay === userId: " + userId);
		System.out.println("===== AirplanePay === itemName: " + itemName);
		System.out.println("===== AirplanePay === seatClass: " + seatClass);
		System.out.println("===== AirplanePay === adultCount: " + adultCount);
		System.out.println("===== AirplanePay === childCount: " + childCount);
		System.out.println("===== AirplanePay === infantCount: " + infantCount);
		System.out.println("===== AirplanePay === totalCount: " + totalCount);
		System.out.println("===== AirplanePay === adultPrice: " + adultPrice);
		System.out.println("===== AirplanePay === childPrice: " + childPrice);
		System.out.println("===== AirplanePay === infantPrice: " + infantPrice);
		System.out.println("===== AirplanePay === totalPrice: " + totalPrice);
		
		kakaoPayService.readyToPay(orderId, userId, itemName, seatClass, adultCount, childCount, infantCount, totalPrice, user_idx);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("orderId", orderId);
		mv.addObject("userId", userId);
		mv.addObject("user_idx", user_idx);
		mv.addObject("itemName", itemName);
		mv.addObject("seatClass", seatClass);
		mv.addObject("adultCount", adultCount);
		mv.addObject("childCount", childCount);
		mv.addObject("infantCount", infantCount);
		mv.addObject("totalCount", totalCount);
		mv.addObject("adultPrice", adultPrice);
		mv.addObject("childPrice", childPrice);
		mv.addObject("infantPrice", infantPrice);
		mv.addObject("totalPrice", totalPrice);
		mv.setViewName("airplane/airplanepay");
		return mv;
		
	}
	
	@RequestMapping("/PaySuccess")
    @ResponseBody
    public ResponseEntity<Map<String, String>> PaySuccess(@RequestBody PaymentVo paymentVo) {
        
        kakaoPayService.savePayment(paymentVo);
        
        Map<String, String> response = new HashMap<>();
        response.put("status", "success");
        
        return ResponseEntity.ok(response);
    }
	
	@RequestMapping("/Filter/GetFlights")
	public ModelAndView filterFlights( User user, @RequestParam Map<String, String> params ) {
		
	System.out.println("===== Filter === params: " + params);
		
		String depCity1 = params.get("depCity1");
        String depCity2 = params.get("ariCity1");
        String ariCity1 = params.get("ariCity1");
        String ariCity2 = params.get("depCity1");
        String depCityCode1 = params.get("depCityCode1");
        String depCityCode2 = params.get("ariCityCode1");
        String ariCityCode1 = params.get("ariCityCode1");
        String ariCityCode2 = params.get("depCityCode1");
        String depDate1 = params.get("depDate1");
        String initform = params.get("initform");

        String seatClassStr = params.get("seatClassStr");
        String seatClass = params.get("seatClass");
        int stype = Integer.parseInt(seatClass);
        
        String adultCountStr = params.get("adultCount");
        int adultCount = Integer.parseInt(adultCountStr);
        String childCountStr = params.get("childCount");
        int childCount = Integer.parseInt(childCountStr);
        String infantCountStr = params.get("infantCount");
        int infantCount = Integer.parseInt(infantCountStr);
        
        List<String> depDate2List = null; // Declare the variable outside the if block

        String depDate2Str = params.get("depDate2[]");
        if (depDate2Str != null) {
            depDate2Str = depDate2Str.substring(1, depDate2Str.length() - 1);
            depDate2List = Arrays.stream(depDate2Str.split("\\],\\["))
                                 .map(s -> s.replace("[", "").replace("]", "").trim())
                                 .collect(Collectors.toList());

            System.out.println("Extracted depDate2 values: " + depDate2List);
        }

        if (depDate2List != null) {
            for (String date : depDate2List) {
                System.out.println("Date: " + date);
            }
        }

	        ModelAndView mv = new ModelAndView();
	        List<Map<String, Object>> airSearchList = new ArrayList<>();

	        String selectedTimeCategory = params.get("timeCategory");
	        Set<String> uncheckedCategories = getUncheckedCategories(params); // 새로운 메서드 호출로 카테고리 초기화

	        if ("RT".equals(initform) && depDate2List != null) {
	            processRoundTrip(depCity1, ariCity1, depCity2, ariCity2, depDate2List, stype, adultCount, childCount, infantCount, airSearchList, mv, uncheckedCategories, selectedTimeCategory);
	        } else {
	            processOneWay(depCity1, ariCity1, depDate1, stype, adultCount, childCount, infantCount, airSearchList, mv, uncheckedCategories, selectedTimeCategory);
	        }

	        mv.addObject("airSearchList", airSearchList);
	        mv.addObject("seatClassStr", params.get("seatClassStr"));
	        mv.addObject("seatClass", stype);
	        mv.addObject("adultCount", adultCount);
	        mv.addObject("childCount", childCount);
	        mv.addObject("infantCount", infantCount);
	        mv.addObject("initform", initform);
	        mv.addObject("selectedTimeCategory", selectedTimeCategory); // 선택된 시간대 추가
	        mv.setViewName("airplane/airplanefilter");
	        return mv;
	    }
	
	private Set<String> getUncheckedCategories(Map<String, String> params) {
		Set<String> uncheckedCategories = new HashSet<>();
	    
	    // 예: 사용자가 체크 해제한 항공사 카테고리들을 추출
	    for (Map.Entry<String, String> entry : params.entrySet()) {
	        String key = entry.getKey();
	        String value = entry.getValue();
	        
	        // key가 "uncheckedCategory_"로 시작하고, 값이 "true"인 경우
	        if (key.startsWith("uncheckedCategory_") && "true".equals(value)) {
	            // 예: uncheckedCategory_Airline_KoreanAir 등
	            String[] parts = key.split("_");
	            if (parts.length == 3) {
	                uncheckedCategories.add(parts[2]);
	            }
	        }
	    }
	    
	    return uncheckedCategories;
    }

	private String getTimeCategory(Time startTime) {
		
		int hour = startTime.toLocalTime().getHour();
		
        if (hour < 6) {
            return "06";
        } else if (hour < 12) {
            return "12";
        } else if (hour < 18) {
            return "18";
        } else {
            return "24";
        }
        
    }
	
//	public static class Flight {
//        private Time startTime;
//
//        // getter 및 setter 생략
//        public Time getStartTime() {
//            return startTime;
//        }
//
//        public void setStartTime(Time startTime) {
//            this.startTime = startTime;
//        }
//        
//        @Override
//        public String toString() {
//            return "Flight{" +
//                    "startTime=" + startTime +
//                    '}';
//        }
//        
//    }
	
	private boolean shouldRemoveFlight(String category, Set<String> uncheckedCategories) {
	    // uncheckedCategories가 null인지 확인
	    if (uncheckedCategories != null && uncheckedCategories.contains(category)) {
	        return true;
	    }
	    return false;
	}
	
//	@PostMapping("/filterFlights")
//	@ResponseBody
//	public ModelAndView filterFlights(@RequestBody Map<String, List<String>> filters) {
//		
//	    List<String> departureTimes = filters.get("departureTimes");
//	    System.out.println("===== filterFlights === departureTimes: " + departureTimes);
//
//	    List<Flight> filteredFlights = filterService.filterFlightsByDepartureTimes(departureTimes);
//	    System.out.println("===== filterFlights === filteredFlights: " + filteredFlights);
//
//	    ModelAndView mav = new ModelAndView("filteredFlightData");
//	    mav.addObject("roundTripFlights", filteredFlights);
//	    
//	    return mav;
//	}
	
	@PostMapping("/filterFlights")
	@ResponseBody
	public String filterFlights(@RequestBody Map < String, List < String >> filters, Model model) {

	    List<String> departureTimes = filters.get("departureTimes");
	    System.out.println("===== filterFlights === departureTimes: " + departureTimes);

	    String startTime1 = departureTimes.get(0);
	    System.out.println("===== filterFlights === startTime1: " + startTime1);

	    List < Flight > filteredFlights = filterService.filterFlightsByDepartureTimes(departureTimes);
	    System.out.println("===== filterFlights === filteredFlights: " + filteredFlights);

	    model.addAttribute("roundTripFlights", filteredFlights);
	    return "filteredFlightData"; // 이 부분은 filteredFlightData.jsp로 변경하여 해당 데이터를 렌더링 합니다.
	}
	
}