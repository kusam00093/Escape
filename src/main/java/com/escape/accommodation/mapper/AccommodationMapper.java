package com.escape.accommodation.mapper;

import java.util.List;
import java.util.Map;

import javax.naming.directory.SearchResult;

import org.apache.ibatis.annotations.Mapper;

import com.escape.accommodation.domain.Hotel;

@Mapper
public interface AccommodationMapper {

	List<SearchResult> search(String query);
	
	List<Hotel> searchHotels(Map<String, Object> params);

}
