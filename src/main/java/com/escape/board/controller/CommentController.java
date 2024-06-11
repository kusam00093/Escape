package com.escape.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.escape.board.domain.CommentVo;
import com.escape.board.mapper.BoardMapper;
import com.escape.board.mapper.CommentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommentController {
	
	//BOARD_COMMENT_TB
	@Autowired
	   private CommentMapper commentMapper;
	@Autowired
		private BoardMapper boardMapper;
	
	@GetMapping("/Api/Board/{board_idx}/commentGet")
	@ResponseBody
	   public List<CommentVo> commentGet (
	         @PathVariable Long board_idx // 여기 수상했었음
	        // ,@RequestBody CommentVo commentVo
	         ){
	      
	      // 댓글 목록 조회 
	      List<CommentVo> commentList = commentMapper.getCommentList(board_idx);
	      log.info("================commentList : {}", commentList);
	      return commentList;
	   }
	
	
	@PostMapping("/Api/Board/{board_idx}/commentCreate")
	@ResponseBody
	public List<CommentVo> commentCreate (
			@PathVariable Long board_idx
		 ,@RequestBody CommentVo commentVo
			){
		
		// 댓글 목록 조회 
		List<CommentVo> commentList = commentMapper.getCommentList(board_idx);
		
		// 댓글 생성
		commentVo.setBoard_idx(board_idx);
		commentMapper.insertComment(commentVo);

		log.info("================commentList : {}", commentList);
		return commentList;
	}
	
	//@PostMapping("/Api/Board/{board_comment_idx}/commentDelete")
	
	@PostMapping("/Api/Board/{board_idx}/{board_comment_idx}/commentDelete")
	@ResponseBody
    public List<CommentVo> deleteCreate(
    		
          @PathVariable Long board_idx 
         ,@PathVariable Long board_comment_idx
 		 ,@RequestBody CommentVo commentVo
          ) {
	//	CommentVo commentVo = new CommentVo();
	    //BoardVo boardVo = new BoardVo();
    //   
       // 댓글 삭제
		commentVo.setBoard_comment_idx(board_comment_idx);
		commentVo.setBoard_idx(board_idx);
		//commentMapper.deleteComment(board_comment_idx);
		commentMapper.deleteComment(commentVo);
		log.info("================board_comment_idx : {}", board_comment_idx);
		log.info("================board_idx : {}", board_idx);
       
      // 댓글 목록 조회 
     // List<CommentVo> commentList = commentMapper.getCommentList(board_idx);
      List<CommentVo> commentList = commentMapper.getCommentList(commentVo);
       
       return commentList;
    }
	
	@PostMapping("/Api/Board/{board_idx}/{board_comment_idx}/commentAddlike")
	@ResponseBody
	public ResponseEntity<String> AddLike(@RequestBody CommentVo commentVo) {
		   
	      
		CommentVo comment_likes = commentMapper.selectLikes(commentVo);
	       System.out.println("11111111111111111111111111111111");
	       System.out.println(comment_likes);
	       System.out.println(commentVo);
	       
	       if(comment_likes != null) {
	          System.out.println(1 + "북마크가 존재함");
	          commentMapper.updateLikes(comment_likes); // 그냥 bookmarkVo로 받아도 됨 근데 where문을 하나로 하고싶었음
	          return ResponseEntity.ok("북마크가 존재함 update");
	          
	       }else {
	          System.out.println(2 + "북마크가 존재안함"); 
	          commentMapper.addLikes(commentVo); //insert
	          System.out.println(commentVo);
	          return ResponseEntity.ok("북마크가 존재안함 insert");
	       }
	   }
	/*
    public Integer checkcommentAddlike (
    	       @PathVariable Long board_idx 
    	      ,@PathVariable Long board_comment_idx
    	 	  ,@RequestBody CommentVo commentVo
          )   {
       
       // 현재 좋아요 상태 확인
        int isLiked = commentMapper.isCommentLiked(commentVo);
        log.info("===========checkcommentLike============");
 
        return isLiked;
    }*/
	
}
