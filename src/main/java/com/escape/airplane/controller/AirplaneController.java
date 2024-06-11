package com.escape.airplane.controller;

import java.time.Duration;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.escape.airplane.domain.AirplaneSearchVo;
import com.escape.airplane.domain.AirplaneVo;
import com.escape.airplane.domain.AirportVo;
import com.escape.airplane.domain.CityVo;
import com.escape.airplane.mapper.AirplaneMapper;

@Controller
@RequestMapping("/Airplane")
public class AirplaneController {

	@Autowired
	private AirplaneMapper airplaneMapper;
	
	@RequestMapping("/Main")
	public ModelAndView main( AirplaneVo airplaneVo ) {

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
	    //String depDate2 = params.get("depDate2");
	    String initform = params.get("initform");
	    String seatClass = params.get("seatClass");

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
		System.out.println("=======depDates2: " + depDates2);
		System.out.println("=======initform: " + initform);
		System.out.println("=======seatClass: " + seatClass);
		System.out.println("=======adultCount: " + adultCount);
		System.out.println("=======childCount: " + childCount);
		System.out.println("=======infantCount: " + infantCount);
		
		// 2. 넘어온 값 DB 조회 위한 값으로 변경 (도시명 → idx / ex. 서울 → 1 , 도쿄 → 10)
		List<CityVo> departureLoc1 = airplaneMapper.getDepartureInfo( depCity1 );
		System.out.println( "=======departureLoc1: " + departureLoc1 );	// [CityVo [city_idx=1, country_idx=1, name=서울, ename=SEL]]
		CityVo dfirstAirplane1 = departureLoc1.get(0);
		int departure_loc1 = dfirstAirplane1.getCity_idx();
		System.out.println( "=======departure_loc1: " + departure_loc1 );	// 1
		 
        List<CityVo> arrivalLoc1 = airplaneMapper.getArrivalInfo( ariCity1 );
        System.out.println( "=======arrivalLoc1: " + arrivalLoc1 );	// [CityVo [city_idx=10, country_idx=2, name=도쿄, ename=TYO]]
        CityVo afirstAirplane1 = arrivalLoc1.get(0);
        int arrival_loc1 = afirstAirplane1.getCity_idx();
        System.out.println( "=======arrival_loc1: " + arrival_loc1 );	// 10
        
        List<Map<String, Object>> airSearchList = new ArrayList<>();
        
        if ("RT".equals(initform) && depDates2 != null) {
	        for (String depDate2 : depDates2) {
	        	
	        	List<CityVo> departureLoc2 = airplaneMapper.getDepartureInfo( depCity2 );
	    		System.out.println( "=======departureLoc2: " + departureLoc2 );
	    		CityVo dfirstAirplane2 = departureLoc2.get(0);
	    		int departure_loc2 = dfirstAirplane2.getCity_idx();
	    		System.out.println( "=======departure_loc2: " + departure_loc2 );
	    		
	    		List<CityVo> arrivalLoc2 = airplaneMapper.getArrivalInfo( ariCity2 );
	            System.out.println( "=======arrivalLoc2: " + arrivalLoc2 );
	            CityVo afirstAirplane2 = arrivalLoc2.get(0);
	            int arrival_loc2 = afirstAirplane2.getCity_idx();
	            System.out.println( "=======arrival_loc2: " + arrival_loc2 );
	        	
	            List<Map<String, Object>> tempList = airplaneMapper.getTimeList(depDate2, departure_loc2, arrival_loc2);
	            System.out.println( "=======tempList1: " + tempList );
	            airSearchList.addAll(tempList);
	            
	            calculateDuration(airSearchList);
	            
	        }
        } else {
        	List<Map<String, Object>> tempList = airplaneMapper.getTimeList(depDate1, departure_loc1, arrival_loc1);
        	System.out.println( "=======tempList2: " + tempList );
        	airSearchList.addAll(tempList);
            
            calculateDuration(airSearchList);
        }
		
        System.out.println( "=======airSearchList: " + airSearchList );
        
		ModelAndView mv = new ModelAndView();
		mv.addObject("airSearchList", airSearchList);

		// 3. 넘어온 value 값 기준 DB 조회 (정보 : 출발날짜, 도착날짜, 출발지, 도착지)
		// 왕복 경우
//		if ("RT".equals(initform) && depDate2 != null) {
//			
//			List<Map<String, Object>> returnSearchList = airplaneMapper.getReturnTimeList(depDate, arrdate, departure_loc, arrival_loc);
//			System.out.println("=======returnSearchList: " + returnSearchList);
//			//System.out.println("=======targetAirplaneIdx: " + returnSearchList.get(0).get("AIRPLANE_IDX"));
//			//Object targetAirplaneIdx = returnSearchList.get(0).get("AIRPLANE_IDX");
//			
//			for (Map<String, Object> flight : returnSearchList) {
//
//				Object targetAirplaneIdx = flight.get("AIRPLANE_IDX");
//			    System.out.println("=======targetAirplaneIdx: " + targetAirplaneIdx);
//			    
//			    mv.addObject("targetAirplaneIdx", targetAirplaneIdx);
//			}
//			
//			calculateDuration(returnSearchList);
//			
//			mv.addObject("returnSearchList", returnSearchList);
//			
//		} else {
//			
//			// 왕복 아닐 경우
//			List<Map<String, Object>> airSearchList = airplaneMapper.getTimeList(depDate, departure_loc, arrival_loc);
//			System.out.println("=======airSearchList: " + airSearchList);
//			
//			for (Map<String, Object> flight : airSearchList) {
//
//				Object targetAirplaneIdx = flight.get("AIRPLANE_IDX");
//			    System.out.println("=======targetAirplaneIdx: " + targetAirplaneIdx);
//			    
//			    mv.addObject("targetAirplaneIdx", targetAirplaneIdx);
//			}
//			
//			calculateDuration(airSearchList);
//			
//			mv.addObject("airSearchList", airSearchList);
//		}
		
		mv.setViewName("airplane/airplanesearch");
		return mv;
		
	}
	
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

	
}