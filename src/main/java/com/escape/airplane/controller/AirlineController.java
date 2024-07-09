package com.escape.airplane.controller;

import com.escape.airplane.domain.AirplaneTimeVo;
import com.escape.airplane.mapper.AirplaneMapper;
import com.escape.airplane.service.FlightService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/Airline")
public class AirlineController {

    @Autowired
    private FlightService flightService;
    
    @Autowired
	private AirplaneMapper airplaneMapper;

    @PostMapping("/Search")
    public ResponseEntity<Map<String, Object>> searchapi(@RequestParam Map<String, Object> params, AirplaneTimeVo airplaneTimeVo) {

    	System.out.println("===== Airline/Search === params1: " + params);
      
	      int stype = Integer.parseInt((String) params.get("stype"));
	      int adultCount = Integer.parseInt((String) params.get("adultCount"));
	      int childCount = Integer.parseInt((String) params.get("childCount"));
	      int infantCount = Integer.parseInt((String) params.get("infantCount"));
	      
	      List<Integer> ptypeList = new ArrayList<>();
	      if (adultCount > 0) ptypeList.add(1);
	      if (childCount > 0) ptypeList.add(2);
	      if (infantCount > 0) ptypeList.add(3);
	
	      params.put("ptypeList", ptypeList);
	      System.out.println("===== Airline/Search === params2: " + params);
	      
	      String initform = (String) params.get("initform");
	      List<AirplaneTimeVo> flightInfo;
	
	      if ("OW".equalsIgnoreCase(initform)) {
	          flightInfo = flightService.getOneWayFlightInfo(params);
	      } else {
	          flightInfo = flightService.getRoundTripFlightInfo(params);
	      }
	      
	      calculateDuration(flightInfo);
	      calculatePrice(flightInfo, adultCount, childCount, infantCount, stype, initform);
	      System.out.println("===== Airline/Search === flightInfo: " + flightInfo);
	      
        Map<String, Object> response = new HashMap<>();
        response.put("params", params);
        response.put("flightInfo", flightInfo);

        return ResponseEntity.ok(response);
    }
    
	// 소요시간 계산
	private void calculateDuration(List<AirplaneTimeVo> flightInfo) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		
		for (AirplaneTimeVo flight : flightInfo) {
			
			String startTime = flight.getStartTime1().toString();
			String endTime = flight.getEndTime1().toString();

			LocalDateTime startDateTime = LocalDateTime.parse(startTime, formatter);
	        LocalDateTime endDateTime = LocalDateTime.parse(endTime, formatter);
	        
	        Duration duration = Duration.between(startDateTime, endDateTime);

			flight.setDurationhour(String.valueOf(duration.toHours()));
	        flight.setDurationminute(String.valueOf(duration.toMinutes() % 60));
		}
	}
	
	// 가격 계산
	private void calculatePrice(List<AirplaneTimeVo> flightInfo, int adultCount, int childCount, int infantCount, int stype, String initform) {
	    for (AirplaneTimeVo flight : flightInfo) {
	        int airplaneTimeIdx = flight.getAirplane_time_idx1();
	        System.out.println("===== Airline/calculatePrice === airplaneTimeIdx: " + airplaneTimeIdx);

	        // 성인 가격 계산
	        int adultPrice = airplaneMapper.getPriceInfo(airplaneTimeIdx, 1, stype) * adultCount;
	        // 소아 가격 계산
	        int childPrice = airplaneMapper.getPriceInfo(airplaneTimeIdx, 2, stype) * childCount;
	        // 유아 가격 계산
	        int infantPrice = airplaneMapper.getPriceInfo(airplaneTimeIdx, 3, stype) * infantCount;

	        int totalPrice = adultPrice + childPrice + infantPrice;
	        
	        //flight.setTotalPrice(totalPrice);

	        if (initform.equals("RT")) {
	        	flight.setTotalPrice(totalPrice*2);
	        } else {
	        	flight.setTotalPrice(totalPrice);
	        }
	    }
	}
	
	@PostMapping("/Filter")
    public ResponseEntity<Map<String, Object>> filter(
            @RequestParam Map<String, Object> params,
            @RequestParam(value = "checkboxId[]", required = false) List<String> checkboxIds,
            @RequestParam(value = "airlineNames[]", required = false) List<String> airlineNames,
            @RequestParam(value = "priceRange", required = false) String priceRange,
            @RequestParam(value = "airplaneTimeIdx[]", required = false) List<Integer> airplaneTimeIdx
            ) throws JsonMappingException, JsonProcessingException {
		
        System.out.println("Airline/Filter-params1: " + params);
        System.out.println("Airline/Filter-airlineNames: " + airlineNames);
        System.out.println("Airline/Filter-priceRange: " + priceRange);

        int stype = Integer.parseInt((String) params.get("stype"));
        int adultCount = Integer.parseInt((String) params.get("adultCount"));
        int childCount = Integer.parseInt((String) params.get("childCount"));
        int infantCount = Integer.parseInt((String) params.get("infantCount"));

        List<Integer> ptypeList = new ArrayList<>();
        if (adultCount > 0) ptypeList.add(1);
        if (childCount > 0) ptypeList.add(2);
        if (infantCount > 0) ptypeList.add(3);

        params.put("ptypeList", ptypeList);

        boolean isChecked = Boolean.parseBoolean((String) params.get("isChecked"));
        System.out.println("Airline/Filter-isChecked: " + isChecked);
        System.out.println("Airline/Filter-checkboxIds: " + checkboxIds);

        ObjectMapper objectMapper = new ObjectMapper();
        String timeRangesJson1 = (String) params.get("timeRanges1");
        List<Map<String, String>> timeRanges1 = objectMapper.readValue(timeRangesJson1, new TypeReference<List<Map<String, String>>>(){});
        System.out.println("===== Airline/Filter-timeRanges1: " + timeRanges1);
        String timeRangesJson2 = (String) params.get("timeRanges2");
        List<Map<String, String>> timeRanges2 = objectMapper.readValue(timeRangesJson2, new TypeReference<List<Map<String, String>>>(){});
        System.out.println("===== Airline/Filter-timeRanges2: " + timeRanges2);

        params.put("timeRanges1", timeRanges1);
        params.put("timeRanges2", timeRanges2);
        params.put("airlineNames", airlineNames);
        if (priceRange != null) {
            params.put("priceRange", Integer.parseInt(priceRange));
        }

        System.out.println("Airline/Filter-params2: " + params);

        String initform = (String) params.get("initform");
        List<AirplaneTimeVo> flightInfo;

        if ("OW".equalsIgnoreCase(initform)) {
            flightInfo = flightService.getOneWayFilterInfo(params);
        } else {
            flightInfo = flightService.getRoundTripFilterInfo(params);
        }
        
        System.out.println("Airline/Filter-flightInfo: " + flightInfo);

        calculateDuration(flightInfo);
        calculatePrice(flightInfo, adultCount, childCount, infantCount, stype, initform);
        
        // 필터링: totalPrice가 priceRange 이하인 항공편만 남김
        int priceRangeInt = params.containsKey("priceRange") ? (int) params.get("priceRange") : Integer.MAX_VALUE;
        System.out.println("Airline/Filter-priceRangeInt: " + priceRangeInt);
        flightInfo = flightInfo.stream()
                .filter(flight -> flight.getTotalPrice() <= priceRangeInt)
                .collect(Collectors.toList());
        
        System.out.println("Airline/Filter-flightInfo: " + flightInfo);

        Map<String, Object> response = new HashMap<>();
        response.put("params", params);
        response.put("flightInfo", flightInfo);

        return ResponseEntity.ok(response);
    }
	
}