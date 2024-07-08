package com.escape.domain;

import java.util.ArrayList;
import java.util.List;

import com.escape.board.domain.Pagination;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PagingResponse<T> {

    private List<T> list = new ArrayList<>();
    private Pagination pagination;

    public PagingResponse(List<T> list, Pagination pagination) {
        this.list.addAll(list);
        this.pagination = pagination;
    }
    
    public PagingResponse(List<T> list, Pagination pagination, List<T> listInfo, int offset) {
        //this.list.addAll(list);
    	for(int i = 0; i < offset; i++) {
    		this.list.add(listInfo.get(i));
    	}
        this.pagination = pagination;
    }

}
