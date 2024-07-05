package com.escape.airplane.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

        // Consolidate flights by unique airplane_time_idx
        return consolidateFlights(flights);
    }

    public List<AirplaneTimeVo> getRoundTripFlightInfo(Map<String, Object> params) {
        formatDateParams(params);
        List<AirplaneTimeVo> flights = airplaneMapper.getRoundTripFlightInfo(params);

        // Consolidate flights by unique airplane_time_idx
        return consolidateFlights(flights);
    }

    private void formatDateParams(Map<String, Object> params) {
        if (params.containsKey("depDate")) {
            String depDateStr = (String) params.get("depDate");
            LocalDate depDate = LocalDate.parse(depDateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            params.put("depDate", depDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            LocalDate depDatePlusOne = depDate.plusDays(1);
            params.put("depDate2", depDatePlusOne.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        }
        if (params.containsKey("arrDate")) {
            String arrDateStr = (String) params.get("arrDate");
            LocalDate arrDate = LocalDate.parse(arrDateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            LocalDate arrDatePlusOne = arrDate.plusDays(1);
            params.put("arrDate", arrDatePlusOne.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        }
    }
    
    // 승객명수 조건 unique
    private List<AirplaneTimeVo> consolidateFlights(List<AirplaneTimeVo> flights) {
        Map<Integer, AirplaneTimeVo> flightMap = new HashMap<>();
        for (AirplaneTimeVo flight : flights) {
            int key = flight.getAirplane_time_idx();
            if (!flightMap.containsKey(key)) {
                flightMap.put(key, flight);
            } else {
                // If the flight already exists, update its price or other details if necessary
                AirplaneTimeVo existingFlight = flightMap.get(key);
                existingFlight.setTotalPrice(existingFlight.getTotalPrice() + flight.getTotalPrice());
            }
        }
        return new ArrayList<>(flightMap.values());
    }
    
    // 필터링-편도
	public List<AirplaneTimeVo> getOneWayFilterInfo(Map<String, Object> params) {
		
		formatDateParams(params);
        List<AirplaneTimeVo> flights = airplaneMapper.getOneWayFilterInfo(params);

        // Consolidate flights by unique airplane_time_idx
        return consolidateFlights(flights);
        
	}

	// 필터링-왕복
	public List<AirplaneTimeVo> getRoundTripFilterInfo(Map<String, Object> params) {
		
		formatDateParams(params);
		System.out.println("===== Service/getRoundTripFilterInfo === params: " + params );
        List<AirplaneTimeVo> flights = airplaneMapper.getRoundTripFilterInfo(params);

        // Consolidate flights by unique airplane_time_idx
        return consolidateFlights(flights);
        
	}
}
