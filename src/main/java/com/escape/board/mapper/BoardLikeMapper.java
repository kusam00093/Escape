package com.escape.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.escape.board.domain.BoardlikeVo;

@Mapper
public interface BoardLikeMapper {

	List<BoardlikeVo> getBoardLikeList(Long board_idx);

	//BoardlikeVo selectBlike(Long board_idx);

	void deleteBlike(BoardlikeVo boardlikeVo);

	void addBlike(BoardlikeVo boardlikeVo);

	BoardlikeVo selectBlike(int user_idx);

}
