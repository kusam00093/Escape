package com.escape.airplane.mapper;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.escape.airplane.domain.AirportVo;
import com.escape.airplane.domain.CityVo;

@Mapper
public interface AirplaneMapper {

	List<CityVo> getDepartureInfo(String depCity);
	List<CityVo> getArrivalInfo(String ariCity);
	
	List<AirportVo> getDepAirportName(AirportVo airportVo, int departure_loc);
	List<AirportVo> getArrAirportName(AirportVo airportVo, int arrival_loc);

	//List<Map<String, Object>> getTimeList(String depDate, int departure_loc, int arrival_loc);
	List<Map<String, Object>> getTimeList(String depDate1, int departure_loc1, int arrival_loc1, int stype);

	int getUserIdx(Object object);
	
	int getPriceInfo(BigDecimal airplaneTimeIdx, BigDecimal ptypeIdx, int stype);
	
}