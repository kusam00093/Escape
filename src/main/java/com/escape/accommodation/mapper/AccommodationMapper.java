package com.escape.accommodation.mapper;

import java.util.List;

import javax.naming.directory.SearchResult;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AccommodationMapper {

	List<SearchResult> search(String query);

//	void insertSearchHistory(SearchHistory searchHistory);
//
//	List<SearchHistory> getSearchHistory(int user_idx);
	

}