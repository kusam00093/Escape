package com.escape.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.escape.board.domain.BoardVo;
import com.escape.board.domain.CommentVo;

@Mapper
public interface CommentMapper {

	List<CommentVo> getCommentList(CommentVo commentVo);

	List<CommentVo> getCommentList(Long board_idx);

	void insertComment(CommentVo commentVo);
	void insertCommentLike(CommentVo commentVo);

	void deleteComment(CommentVo commentVo);

	int isCommentLiked(CommentVo commentVo);



	void updateLikes(CommentVo commentVo);

	void addLikes(CommentVo commentVo);

	void deleteLikes(CommentVo commentVo);

	CommentVo selectLikes(CommentVo commentVo);




}

