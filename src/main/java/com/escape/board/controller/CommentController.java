package com.escape.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.escape.board.domain.CommentVo;
import com.escape.board.mapper.CommentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommentController {
	
	//BOARD_COMMENT_TB
	@Autowired
	   private CommentMapper commentMapper;
	
	@GetMapping("/Api/Board/{board_idx}/commentGet")
	@ResponseBody
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
	
	
	@PostMapping("/Api/Board/{board_idx}/commentCreate")
	@ResponseBody
	public List<CommentVo> commentCreate (
			@PathVariable Long board_idx // 여기 수상했었음
		 ,@RequestBody CommentVo commentVo
			){
		
		// 댓글 목록 조회 
		List<CommentVo> commentList = commentMapper.getCommentList(board_idx);
		
		// 댓글 생성
		commentMapper.insertComment(commentVo);

		log.info("================commentList : {}", commentList);
		log.info("================commentList : {}", commentList);
		log.info("================commentList : {}", commentList);
		log.info("================commentList : {}", commentList);
		return commentList;
	}
}
