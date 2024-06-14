package com.escape.accommodation.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class SearchResult {
	
	private String name;

	public SearchResult() {}
	public SearchResult(String name) {
		super();
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "SearchResult [name=" + name + "]";
	}
	
}