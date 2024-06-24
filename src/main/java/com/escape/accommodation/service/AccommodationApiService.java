package com.escape.accommodation.service;


import java.util.List;

import javax.naming.directory.SearchResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.accommodation.domain.SearchHistory;
import com.escape.accommodation.mapper.AccommodationMapper;

@Service
public class AccommodationApiService {
	
	@Autowired
	private AccommodationMapper accommodationMapper;
	
	public List<SearchResult> search(String query) {
		return accommodationMapper.search(query);
	}

//	public void addSearchHistory(int user_idx, String query) {
//		SearchHistory searchHistory = new SearchHistory();
//		searchHistory.setUser_idx(user_idx);
//		searchHistory.setSearch_query(query);
//		accommodationMapper.insertSearchHistory(searchHistory);
//	} 
//	public List<SearchHistory> getSearchHistory(int user_idx) {
//		return accommodationMapper.getSearchHistory(user_idx);
//	}
//	

}