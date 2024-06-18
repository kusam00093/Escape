package com.escape.airplane.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.Duration;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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

		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("airplane/airplanemain");
		return mv;
		
	}
	
	@RequestMapping("/Search")
    @ResponseBody
    public ModelAndView search(
                @RequestParam Map<String, String> params,
                @RequestParam(value="depDate2[]", required = false) List<String> depDates2,
                AirplaneVo airplaneVo,
                AirplaneSearchVo airplaneSearchVo,
                AirportVo airportVo,
                CityVo cityVo
             ) {
        
        // 1. airplanemain.jsp 에서 선택한 항공권 조건 value 값 받기 
        String depCity1 = params.get("depCity1");
        String depCity2 = params.get("depCity2");
        String ariCity1 = params.get("ariCity1");
        String ariCity2 = params.get("ariCity2");
        String depCityCode1 = params.get("depCityCode1");
        String depCityCode2 = params.get("depCityCode2");
        String ariCityCode1 = params.get("ariCityCode1");
        String ariCityCode2 = params.get("ariCityCode2");
        String depDate1 = params.get("depDate1");
        String initform = params.get("initform");

        String seatClassStr = params.get("seatClass");
        int stype = Integer.parseInt(seatClassStr);
        String adultCountStr = params.get("adultCount");
        int adultCount = Integer.parseInt(adultCountStr);
        String childCountStr = params.get("childCount");
        int childCount = Integer.parseInt(childCountStr);
        String infantCountStr = params.get("infantCount");
        int infantCount = Integer.parseInt(infantCountStr);
        
        System.out.println("=======params: " + params);
		System.out.println("=======depCity1: " + depCity1);
		System.out.println("=======ariCity1: " + ariCity1);
		System.out.println("=======depCityCode1: " + depCityCode1);
		System.out.println("=======ariCityCode1: " + ariCityCode1);
		System.out.println("=======depCity2: " + depCity2);
		System.out.println("=======ariCity2: " + ariCity2);
		System.out.println("=======depCityCode2: " + depCityCode2);
		System.out.println("=======ariCityCode2: " + ariCityCode2);
		System.out.println("=======depDate1: " + depDate1);
		System.out.println("=======depDate2[]: " + depDates2);
		System.out.println("=======initform: " + initform);
		System.out.println("=======seatClassStr: " + seatClassStr);
		System.out.println("=======stype: " + stype);
		System.out.println("=======adultCount: " + adultCount);
		System.out.println("=======childCount: " + childCount);
		System.out.println("=======infantCount: " + infantCount);
        
        ModelAndView mv = new ModelAndView();
        
        // 2. 넘어온 값 DB 조회 위한 객체배열 생성
        List<Map<String, Object>> airSearchList = new ArrayList<>();

        // 왕복(RT) 코드
        if ("RT".equals(initform) && depDates2 != null) {
            
            // 도시 정보를 인덱스로 변경
        	List<CityVo> departureLoc1 = airplaneMapper.getDepartureInfo(depCity1);
 	        CityVo dfirstAirplane1 = departureLoc1.get(0);
 	        int departure_loc1 = dfirstAirplane1.getCity_idx();
 	        System.out.println("===== departureLoc1 =====: " + departureLoc1);
 	        System.out.println("===== departure_loc1 =====: " + departure_loc1);

 	        List<CityVo> arrivalLoc1 = airplaneMapper.getArrivalInfo(ariCity1);
 	        CityVo afirstAirplane1 = arrivalLoc1.get(0);
 	        int arrival_loc1 = afirstAirplane1.getCity_idx();
 	        System.out.println("===== arrivalLoc1 =====: " + arrivalLoc1);
 	        System.out.println("===== arrival_loc1 =====: " + arrival_loc1);

 	        List<CityVo> departureLoc2 = airplaneMapper.getDepartureInfo(depCity2);
 	        CityVo dfirstAirplane2 = departureLoc2.get(0);
 	        int departure_loc2 = dfirstAirplane2.getCity_idx();
 	        System.out.println("===== departureLoc2 =====: " + departureLoc2);
 	        System.out.println("===== departure_loc2 =====: " + departure_loc2);
 	        
 	        List<CityVo> arrivalLoc2 = airplaneMapper.getArrivalInfo(ariCity2);
 	        CityVo afirstAirplane2 = arrivalLoc2.get(0);
 	        int arrival_loc2 = afirstAirplane2.getCity_idx();
 	        System.out.println("===== arrivalLoc2 =====: " + arrivalLoc2);
 	        System.out.println("===== arrival_loc2 =====: " + arrival_loc2);
            
            // depDates2 배열의 각 날짜 처리
            for (String depDate2 : depDates2) {
                List<Map<String, Object>> tempList;
                if (depDate2.equals(depDates2.get(0))) {
                    // 첫 번째 날짜는 원래 출발지와 도착지 사용
                    tempList = airplaneMapper.getTimeList(depDate2, departure_loc1, arrival_loc1, stype);
                    System.out.println("===== tempList1 =====: " + tempList);
                } else {
                    // 두 번째 날짜는 출발지와 도착지를 변경
                    tempList = airplaneMapper.getTimeList(depDate2, departure_loc2, arrival_loc2, stype);
                    System.out.println("===== tempList2 =====: " + tempList);
                }
                //calculatePrice(tempList, adultCount, childCount, infantCount);
                calculatePrice(tempList, adultCount, childCount, infantCount, stype);
                airSearchList.addAll(tempList);
                System.out.println("===== airSearchList1 =====: " + airSearchList);
            }
            
            calculateDuration(airSearchList);
            
            // 왕복 항공편 연결
            Map<Integer, List<Map<String, Object>>> groupedFlights = airSearchList.stream()
                    .collect(Collectors.groupingBy(flight -> ((BigDecimal) flight.get("AIRPLANE_IDX")).intValue()));
            System.out.println("===== groupedFlights =====: " + groupedFlights);
            
            List<List<Map<String, Object>>> roundTripFlights = new ArrayList<>();
            List<Integer> roundTripPrices = new ArrayList<>();  // 왕복 항공편 가격 목록
            
            for (List<Map<String, Object>> flights : groupedFlights.values()) {
            	System.out.println("===== flights0 =====: " + flights);
                
                List<Map<String, Object>> roundTrip = new ArrayList<>();
                System.out.println("===== roundTrip0 =====: " + roundTrip);

                int totalPrice = 0;  // 각 왕복 항공편의 총 가격 초기화
                
             	// PTYPE_IDX=3 인 항목만 필터링
                List<Map<String, Object>> filteredFlights = flights.stream()
                        .filter(flight -> BigDecimal.valueOf(3).equals(flight.get("PTYPE_IDX")))
                        .collect(Collectors.toList());
                
                for (Map<String, Object> flight : filteredFlights) {
                    
                    if (roundTrip.size() == 2) break;
                    if (roundTrip.isEmpty()) {
                        
                        roundTrip.add(flight);
                        System.out.println("===== flight0 =====: " + flight);
                        System.out.println("===== roundTrip1 =====: " + roundTrip);

                        totalPrice += (int) flight.get("TOTAL_PRICE");  // 첫 번째 구간의 가격 추가
                        System.out.println("===== totalPrice1 =====: " + totalPrice);
                        
                    } else {
                        
                        Map<String, Object> firstFlight = roundTrip.get(0);
                        System.out.println("===== firstFlight =====: " + firstFlight);
                        
                        if (firstFlight.get("DEPARTURE_LOC").equals(flight.get("ARRIVAL_LOC")) &&
                            firstFlight.get("ARRIVAL_LOC").equals(flight.get("DEPARTURE_LOC"))) {
                            
                            roundTrip.add(flight);
                            System.out.println("===== roundTrip2 =====: " + roundTrip);

                            totalPrice += (int) flight.get("TOTAL_PRICE");  // 반환 구간의 가격 추가
                            System.out.println("===== totalPrice2 =====: " + totalPrice);
                            
                        }
                    }
                }
                
                if (roundTrip.size() == 2) {
                    
                    roundTripFlights.add(roundTrip);
                    roundTripPrices.add(totalPrice);  // 왕복 항공편의 총 가격 추가
                    System.out.println("===== roundTripFlights =====: " + roundTripFlights);
                    System.out.println("===== roundTripPrices =====: " + roundTripPrices);
                    
                }
                
                mv.addObject("roundTripFlights", roundTripFlights);
                mv.addObject("roundTripPrices", roundTripPrices);
                
            }
            // 왕복 End--------------
        } else {
            
            // 편도 코드
            List<CityVo> departureLoc1 = airplaneMapper.getDepartureInfo(depCity1);
            CityVo dfirstAirplane1 = departureLoc1.get(0);
            int departure_loc1 = dfirstAirplane1.getCity_idx();

            List<CityVo> arrivalLoc1 = airplaneMapper.getArrivalInfo(ariCity1);
            CityVo afirstAirplane1 = arrivalLoc1.get(0);
            int arrival_loc1 = afirstAirplane1.getCity_idx();

            List<Map<String, Object>> tempList = airplaneMapper.getTimeList(depDate1, departure_loc1, arrival_loc1, stype);
            System.out.println("===== tempList3 =====: " + tempList);
            
            calculatePrice(tempList, adultCount, childCount, infantCount, stype);
            airSearchList.addAll(tempList);
            System.out.println("===== airSearchList2 =====: " + airSearchList);
            
            calculateDuration(airSearchList);
            
            List<List<Map<String, Object>>> oneWayFlights = new ArrayList<>();
            List<Integer> oneWayPrices = new ArrayList<>();  // 편도 항공편 가격 목록

//            for (Map<String, Object> flight : airSearchList) {
//                
//                List<Map<String, Object>> oneWay = new ArrayList<>();
//                
//                oneWay.add(flight);
//                oneWayFlights.add(oneWay);
//                oneWayPrices.add((int) flight.get("TOTAL_PRICE"));
//                System.out.println("===== oneWay =====: " + oneWay);
//                System.out.println("===== oneWayFlights =====: " + oneWayFlights);
//	            System.out.println("===== oneWayPrices =====: " + oneWayPrices);
//                
//            }
            
            for (Map<String, Object> flight : airSearchList) {

                if (BigDecimal.valueOf(3).equals(flight.get("PTYPE_IDX"))) {

                    List<Map<String, Object>> oneWay = new ArrayList<>();

                    oneWay.add(flight);
                    oneWayFlights.add(oneWay);
                    oneWayPrices.add((int) flight.get("TOTAL_PRICE"));

                    System.out.println("===== oneWay =====: " + oneWay);
                    System.out.println("===== oneWayFlights =====: " + oneWayFlights);
                    System.out.println("===== oneWayPrices =====: " + oneWayPrices);

                }

            }

            mv.addObject("oneWayFlights", oneWayFlights);
            mv.addObject("oneWayPrices", oneWayPrices);
            
        }
        
        mv.addObject("airSearchList", airSearchList);
        mv.addObject("seatClass", stype);
        mv.addObject("adultCount", adultCount);
        mv.addObject("childCount", childCount);
        mv.addObject("infantCount", infantCount);
        mv.setViewName("airplane/airplanesearch");
        return mv;
        
    }
    
    // 소요시간 계산
    private void calculateDuration(List<Map<String, Object>> flights) {
        for (Map<String, Object> flight : flights) {
            Object startTimeObj = flight.get("START_TIME");
            String startTime = startTimeObj != null ? startTimeObj.toString() : null;
            Object endTimeObj = flight.get("END_TIME");
            String endTime = endTimeObj != null ? endTimeObj.toString() : null;
            
            if (startTime != null && endTime != null) {
                Duration duration = Duration.between(LocalTime.parse(startTime), LocalTime.parse(endTime));
                Long durationHour = duration.toHours();
                Long durationMinutes = duration.toMinutes() % 60;
                
                flight.put("DURATIONHOUR", durationHour.toString());
                flight.put("DURATIONMINUTE", durationMinutes.toString());
            }
        }
    }
    
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
	
//	@PostMapping("/Filter/GetFlights")
//	@ResponseBody
//	public ResponseEntity<List<Map<String, Object>>> getFilteredFlights(@RequestBody List<AirplaneSearchVo> airplaneSearchVo) {
//		
//		System.out.println("===== Filter/GetFlights === airplaneSearchVo: " + airplaneSearchVo);
//		
//	    List<Map<String, Object>> filteredFlights = airplaneMapper.getFilteredFlights(airplaneSearchVo);
//	    
//	    return ResponseEntity.ok(filteredFlights);
//	}

	@PostMapping("/Filter/GetFlights")
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> getFilteredFlights(@RequestBody AirplaneSearchVo airplaneSearchVo) {
		
	    System.out.println("===== Filter/GetFlights === airplaneSearchVo: " + airplaneSearchVo);
	    
	    List<Map<String, Object>> filteredFlights = airplaneMapper.getFilteredFlights(airplaneSearchVo);
	    
	    return ResponseEntity.ok(filteredFlights);
	    
	}
	
}