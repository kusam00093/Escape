package com.escape.airplane.controller;

import java.time.Duration;
import java.time.LocalTime;
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
				AirplaneVo airplaneVo,
				AirplaneSearchVo airplaneSearchVo,
				AirportVo airportVo,
				CityVo cityVo
			 ) {
		
		// 1. airplanemain.jsp 에서 선택한 항공권 조건 value 값 받기 
		String depCity = params.get("depCity");
	    String ariCity = params.get("ariCity");
	    String depCityCode = params.get("depCityCode");
	    String ariCityCode = params.get("ariCityCode");
	    String depDate = params.get("depDate");
	    String arrdate = params.get("arrdate");
	    String initform = params.get("initform");
	    String seatClass = params.get("seatClass");

	    String adultCountStr = params.get("adultCount");
	    int adultCount = Integer.parseInt(adultCountStr);
	    String childCountStr = params.get("childCount");
	    int childCount = Integer.parseInt(childCountStr);
	    String infantCountStr = params.get("infantCount");
	    int infantCount = Integer.parseInt(infantCountStr);
	    
	    System.out.println("=======params: " + params);
		System.out.println("=======depCity: " + depCity);
		System.out.println("=======ariCity: " + ariCity);
		System.out.println("=======depCityCode: " + depCityCode);
		System.out.println("=======ariCityCode: " + ariCityCode);
		System.out.println("=======depDate: " + depDate);
		System.out.println("=======arrdate: " + arrdate);
		System.out.println("=======initform: " + initform);
		System.out.println("=======seatClass: " + seatClass);
		System.out.println("=======adultCount: " + adultCount);
		System.out.println("=======childCount: " + childCount);
		System.out.println("=======infantCount: " + infantCount);
		
		// 2. 넘어온 값 DB 조회 위한 값으로 변경 (도시명 → idx / ex. 서울 → 1 , 도쿄 → 10)
		List<CityVo> departureLoc = airplaneMapper.getDepartureInfo( depCity );
		System.out.println( "=======departureLoc: " + departureLoc );	// [CityVo [city_idx=1, country_idx=1, name=서울, ename=SEL]]
		CityVo dfirstAirplane = departureLoc.get(0);
		int departure_loc = dfirstAirplane.getCity_idx();
		System.out.println( "=======departure_loc: " + departure_loc );	// 1
		 
        List<CityVo> arrivalLoc = airplaneMapper.getArrivalInfo( ariCity );
        System.out.println( "=======arrivalLoc: " + arrivalLoc );	// [CityVo [city_idx=10, country_idx=2, name=도쿄, ename=TYO]]
        CityVo afirstAirplane = arrivalLoc.get(0);
        int arrival_loc = afirstAirplane.getCity_idx();
        System.out.println( "=======arrival_loc: " + arrival_loc );	// 10
		
		ModelAndView mv = new ModelAndView();

		// 3. 넘어온 value 값 기준 DB 조회 (정보 : 출발날짜, 도착날짜, 출발지, 도착지)
		// 왕복 경우
		if ("RT".equals(initform) && arrdate != null) {
			
			List<Map<String, Object>> returnSearchList = airplaneMapper.getReturnTimeList(depDate, arrdate, departure_loc, arrival_loc);
			System.out.println("=======returnSearchList: " + returnSearchList);
			//System.out.println("=======targetAirplaneIdx: " + returnSearchList.get(0).get("AIRPLANE_IDX"));
			//Object targetAirplaneIdx = returnSearchList.get(0).get("AIRPLANE_IDX");
			
			for (Map<String, Object> flight : returnSearchList) {

				Object targetAirplaneIdx = flight.get("AIRPLANE_IDX");
			    System.out.println("=======targetAirplaneIdx: " + targetAirplaneIdx);
			    
			    mv.addObject("targetAirplaneIdx", targetAirplaneIdx);
			}
			
			calculateDuration(returnSearchList);
			
			mv.addObject("returnSearchList", returnSearchList);
			
		} else {
			
			// 왕복 아닐 경우
			List<Map<String, Object>> airSearchList = airplaneMapper.getTimeList(depDate, departure_loc, arrival_loc);
			System.out.println("=======airSearchList: " + airSearchList);
			
			for (Map<String, Object> flight : airSearchList) {

				Object targetAirplaneIdx = flight.get("AIRPLANE_IDX");
			    System.out.println("=======targetAirplaneIdx: " + targetAirplaneIdx);
			    
			    mv.addObject("targetAirplaneIdx", targetAirplaneIdx);
			}
			
			calculateDuration(airSearchList);
			
			mv.addObject("airSearchList", airSearchList);
		}
		
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