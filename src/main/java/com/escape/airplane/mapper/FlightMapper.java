package com.escape.airplane.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.escape.airplane.model.Flight;

import java.util.List;

@Mapper
public interface FlightMapper {

	List<Flight> findFlightsByDepartureTimes(@Param("departureTimes") List<String> departureTimes);
	
}
