package com.escape.airplane.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.airplane.mapper.FlightMapper;
import com.escape.airplane.model.Flight;

@Service
public class FilterService {

	@Autowired
    private FlightMapper flightMapper;
	
	public List<Flight> filterFlightsByDepartureTimes(List<String> departureTimes) {
        // 중복 값 제거
        List<String> uniqueDepartureTimes = departureTimes.stream().distinct().collect(Collectors.toList());
        
        // 시간 형식 확인
        uniqueDepartureTimes = uniqueDepartureTimes.stream()
                .map(time -> time.length() == 8 ? time : String.format("%02d:00:00", Integer.parseInt(time)))
                .collect(Collectors.toList());

        return flightMapper.findFlightsByDepartureTimes(uniqueDepartureTimes);
    }
	
}
