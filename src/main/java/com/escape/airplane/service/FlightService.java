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

    /*
    public List<AirplaneTimeVo> getFlightInfo(Map<String, Object> params) {
        formatDateParams(params);
        return airplaneMapper.getFlightInfo(params);
    }
    */
    
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
    
    // 필터링-시간대
    public List<AirplaneTimeVo> filterFlights(List<String> departureTimes, List<String> returnTimes, String day) {
        // 필터링 로직 구현
        // departureTimes와 returnTimes를 사용하여 데이터베이스에서 필터링된 항공편을 가져옵니다.
        // 이 예제에서는 단순히 전체 목록을 반환합니다. 실제로는 적절한 쿼리를 사용하여 필터링해야 합니다.
        //List<AirplaneTimeVo> flights = airplaneMapper.getAllFlights();
        List<AirplaneTimeVo> flights = airplaneMapper.getRoundTripFlightInfo();
        return flights.stream()
            .filter(flight -> (day.equals("가는날") && departureTimes.contains(flight.getStartTime1().toString())) ||
                              (day.equals("오는날") && returnTimes.contains(flight.getStartTime2().toString())))
            .collect(Collectors.toList());
    }
}
