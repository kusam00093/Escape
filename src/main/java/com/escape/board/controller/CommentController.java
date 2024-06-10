package com.escape.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escape.board.domain.CommentVo;
import com.escape.board.mapper.CommentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/Api")
public class CommentController {
	
	//BOARD_COMMENT_TB
	@Autowired
	   private CommentMapper commentMapper;
	
	@PostMapping("/Board/{board_idx}/commentGet")
	   public List<CommentVo> commentGet (
	         @PathVariable Long board_idx // 여기 수상했었음
	        // ,@RequestBody CommentVo commentVo
	         ){
	      
	      // 댓글 목록 조회 
	      List<CommentVo> commentList = commentMapper.getCommentList(board_idx);
	      log.info("================commentList : {}", commentList);
	      log.info("================commentList : {}", commentList);
	      log.info("================commentList : {}", commentList);
	      log.info("================commentList : {}", commentList);
	      return commentList;
	   }
}
