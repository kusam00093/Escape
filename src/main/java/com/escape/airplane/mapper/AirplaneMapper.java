package com.escape.airplane.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.escape.airplane.domain.AirplaneSearchVo;
import com.escape.airplane.domain.AirplaneVo;
import com.escape.airplane.domain.AirportVo;
import com.escape.airplane.domain.CityVo;

@Mapper
public interface AirplaneMapper {

	List<CityVo> getDepartureInfo(String depCity);
	List<CityVo> getArrivalInfo(String ariCity);

	List<Map<String, Object>> getTimeList(String depDate, String arrdate, int departure_loc, int arrival_loc);
	
	List<AirportVo> getDepAirportName(AirportVo airportVo, int departure_loc);
	List<AirportVo> getArrAirportName(AirportVo airportVo, int arrival_loc);

}