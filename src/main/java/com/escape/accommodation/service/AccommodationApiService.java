package com.escape.accommodation.service;


import java.util.List;

import javax.naming.directory.SearchResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.accommodation.mapper.AccommodationMapper;

@Service
public class AccommodationApiService {
	
	@Autowired
	private AccommodationMapper accommodationMapper;
	
	public List<SearchResult> search(String query) {
		return accommodationMapper.search(query);
	}

}
