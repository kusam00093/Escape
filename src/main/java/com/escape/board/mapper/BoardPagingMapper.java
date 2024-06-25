package com.escape.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.escape.board.domain.BoardVo;

@Mapper
public interface BoardPagingMapper {

	int pcount(BoardVo boardVo);

	List<BoardVo> getBoardPagingList(Long board_idx, String title, String content, int offset, int pageSize);

	
	

}
