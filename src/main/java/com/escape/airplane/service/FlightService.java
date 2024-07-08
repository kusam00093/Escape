package com.escape.airplane.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.airplane.domain.AirplaneTimeVo;
import com.escape.airplane.mapper.AirplaneMapper;

@Service
public class FlightService {

    @Autowired
    private AirplaneMapper airplaneMapper;

    public List<AirplaneTimeVo> getOneWayFlightInfo(Map<String, Object> params) {
        formatDateParams(params);
        List<AirplaneTimeVo> flights = airplaneMapper.getOneWayFlightInfo(params);

        return flights;
    }

    public List<AirplaneTimeVo> getRoundTripFlightInfo(Map<String, Object> params) {
        formatDateParams(params);
        List<AirplaneTimeVo> flights = airplaneMapper.getRoundTripFlightInfo(params);
        System.out.println("===== Service/flights ===" + flights);

        return flights;
    }

    private void formatDateParams(Map<String, Object> params) {
        String initform = (String) params.get("initform");
        if ("RT".equalsIgnoreCase(initform)) {
            if (params.containsKey("depDate")) {
                String depDateStr = (String) params.get("depDate");
                LocalDate depDate = LocalDate.parse(depDateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                params.put("depDate", depDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                LocalDate depDatePlusOne = depDate.plusDays(1);
                params.put("depDate2", depDatePlusOne.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            }
            if (params.containsKey("arrDate") && !((String) params.get("arrDate")).isEmpty()) {
                String arrDateStr = (String) params.get("arrDate");
                LocalDate arrDate = LocalDate.parse(arrDateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                params.put("arrDate", arrDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                LocalDate arrDatePlusOne = arrDate.plusDays(1);
                params.put("arrDate2", arrDatePlusOne.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            }
        } else if ("OW".equalsIgnoreCase(initform)) {
            if (params.containsKey("depDate")) {
                String depDateStr = (String) params.get("depDate");
                LocalDate depDate = LocalDate.parse(depDateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                params.put("depDate", depDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                LocalDate depDatePlusOne = depDate.plusDays(1);
                params.put("depDate2", depDatePlusOne.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            }
        }
    }
    
    // 필터링-편도
	public List<AirplaneTimeVo> getOneWayFilterInfo(Map<String, Object> params) {
		
		formatDateParams(params);
        List<AirplaneTimeVo> flights = airplaneMapper.getOneWayFilterInfo(params);

        return flights;
        
	}

	// 필터링-왕복
	public List<AirplaneTimeVo> getRoundTripFilterInfo(Map<String, Object> params) {
		
		formatDateParams(params);
		System.out.println("===== Service/getRoundTripFilterInfo === params: " + params );
        List<AirplaneTimeVo> flights = airplaneMapper.getRoundTripFilterInfo(params);

        return flights;
        
	}
	
}