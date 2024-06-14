package com.escape.accommodation.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class SearchHistory {
	
	private int search_history_idx;
	private int user_idx;
	private String search_query;
	private Timestamp search_time;
	
	public SearchHistory() {}
	public SearchHistory(int search_history_idx, int user_idx, String search_query, Timestamp search_time) {
		super();
		this.search_history_idx = search_history_idx;
		this.user_idx = user_idx;
		this.search_query = search_query;
		this.search_time = search_time;
	}
	
	public int getSearch_history_idx() {
		return search_history_idx;
	}
	public void setSearch_history_idx(int search_history_idx) {
		this.search_history_idx = search_history_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getSearch_query() {
		return search_query;
	}
	public void setSearch_query(String search_query) {
		this.search_query = search_query;
	}
	public Timestamp getSearch_time() {
		return search_time;
	}
	public void setSearch_time(Timestamp search_time) {
		this.search_time = search_time;
	}
	
	@Override
	public String toString() {
		return "SearchHistory [search_history_idx=" + search_history_idx + ", user_idx=" + user_idx + ", search_query="
				+ search_query + ", search_time=" + search_time + "]";
	}
	
	
}