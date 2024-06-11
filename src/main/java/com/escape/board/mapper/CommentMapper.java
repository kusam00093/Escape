package com.escape.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.escape.board.domain.CommentVo;

@Mapper
public interface CommentMapper {

	List<CommentVo> getCommentList(CommentVo commentVo);

	List<CommentVo> getCommentList(Long board_idx);

	void insertComment(CommentVo commentVo);

}
