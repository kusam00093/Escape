package com.escape.accommodation.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class SearchRequest {
	
	private int user_idx;
    private String query;
        
    public SearchRequest() {}
	public SearchRequest(int user_idx, String query) {
		super();
		this.user_idx = user_idx;
		this.query = query;
	}
	
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	
	@Override
	public String toString() {
		return "SearchRequest [user_idx=" + user_idx + ", query=" + query + "]";
	}
    
}