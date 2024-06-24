package com.escape.accommodation.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchHistory {
	
	private int search_history_idx;
	private int user_idx;
	private String search_query;
	private Timestamp search_time;
}
