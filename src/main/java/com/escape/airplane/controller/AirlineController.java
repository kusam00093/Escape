package com.escape.airplane.controller;

import com.escape.airplane.domain.AirplaneTimeVo;
import com.escape.airplane.mapper.AirplaneMapper;
import com.escape.airplane.service.FlightService;
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
			
			String startTime1 = flight.getStartTime1().toString();
			String endTime1 = flight.getEndTime1().toString();

			LocalDateTime startDateTime = LocalDateTime.parse(startTime1, formatter);
	        LocalDateTime endDateTime = LocalDateTime.parse(endTime1, formatter);
	        
	        Duration duration = Duration.between(startDateTime, endDateTime);

			flight.setDurationhour(String.valueOf(duration.toHours()));
	        flight.setDurationminute(String.valueOf(duration.toMinutes() % 60));
		}
	}
	
	// 가격 계산
	private void calculatePrice(List<AirplaneTimeVo> flightInfo, int adultCount, int childCount, int infantCount, int stype, String initform) {
	    for (AirplaneTimeVo flight : flightInfo) {
	        int airplaneTimeIdx = flight.getAirplane_time_idx();

	        // 성인 가격 계산
	        int adultPrice = airplaneMapper.getPriceInfo(airplaneTimeIdx, 1, stype) * adultCount;
	        // 소아 가격 계산
	        int childPrice = airplaneMapper.getPriceInfo(airplaneTimeIdx, 2, stype) * childCount;
	        // 유아 가격 계산
	        int infantPrice = airplaneMapper.getPriceInfo(airplaneTimeIdx, 3, stype) * infantCount;

	        int totalPrice = adultPrice + childPrice + infantPrice;

	        flight.setTotalPrice(totalPrice);
	    }
	}
	
	@PostMapping("/Filter")
	public ResponseEntity<Map<String, Object>> filter(@RequestParam Map<String, Object> params, AirplaneTimeVo airplaneTimeVo) {

	    System.out.println("===== Airline/Filter === params1: " + params);

	    int stype = Integer.parseInt((String) params.get("stype"));
	    int adultCount = Integer.parseInt((String) params.get("adultCount"));
	    int childCount = Integer.parseInt((String) params.get("childCount"));
	    int infantCount = Integer.parseInt((String) params.get("infantCount"));

	    List<Integer> ptypeList = new ArrayList<>();
	    if (adultCount > 0) ptypeList.add(1);
	    if (childCount > 0) ptypeList.add(2);
	    if (infantCount > 0) ptypeList.add(3);

	    params.put("ptypeList", ptypeList);

	    // Handle time ranges
	    //boolean isChecked = (Boolean) params.get("isChecked");
	    boolean isChecked = Boolean.parseBoolean((String) params.get("isChecked"));
        int checkboxValue = Integer.parseInt((String) params.get("checkboxValue"));
        System.out.println("===== Airline/Filter === isChecked: " + isChecked);
        System.out.println("===== Airline/Filter === checkboxValue: " + checkboxValue);

        List<TimeRange> departureTimes = new ArrayList<>();
        List<TimeRange> excludedTimes = new ArrayList<>();

        switch (checkboxValue) {
            case 6:
                if (isChecked) {
                    departureTimes.add(new TimeRange("00:00:00", "06:00:00"));
                } else {
                    excludedTimes.add(new TimeRange("00:00:00", "06:00:00"));
                }
                break;
            case 12:
                if (isChecked) {
                    departureTimes.add(new TimeRange("06:00:00", "12:00:00"));
                } else {
                    excludedTimes.add(new TimeRange("06:00:00", "12:00:00"));
                }
                break;
            case 18:
                if (isChecked) {
                    departureTimes.add(new TimeRange("12:00:00", "18:00:00"));
                } else {
                    excludedTimes.add(new TimeRange("12:00:00", "18:00:00"));
                }
                break;
            case 24:
                if (isChecked) {
                    departureTimes.add(new TimeRange("18:00:00", "24:00:00"));
                } else {
                    excludedTimes.add(new TimeRange("18:00:00", "24:00:00"));
                }
                break;
        }

        params.put("departureTimes", departureTimes);
        params.put("excludedTimes", excludedTimes);

	    System.out.println("===== Airline/Filter === params2: " + params);

	    String initform = (String) params.get("initform");
	    List<AirplaneTimeVo> flightInfo;

	    if ("OW".equalsIgnoreCase(initform)) {
	        flightInfo = flightService.getOneWayFilterInfo(params);
	    } else {
	        flightInfo = flightService.getRoundTripFilterInfo(params);
	    }

	    calculateDuration(flightInfo);
	    calculatePrice(flightInfo, adultCount, childCount, infantCount, stype, initform);
	    System.out.println("===== Airline/Filter === flightInfo: " + flightInfo);

	    Map<String, Object> response = new HashMap<>();
	    response.put("params", params);
	    response.put("flightInfo", flightInfo);

	    return ResponseEntity.ok(response);
	}
	
	public class TimeRange {
	    private String start;
	    private String end;

	    public TimeRange(String start, String end) {
	        this.start = start;
	        this.end = end;
	    }

	    public String getStart() {
	        return start;
	    }

	    public String getEnd() {
	        return end;
	    }
	}

    
}
