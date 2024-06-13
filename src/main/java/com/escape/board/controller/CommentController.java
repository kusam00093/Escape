package com.escape.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
	         @PathVariable Long board_idx 
	        // ,@RequestBody CommentVo commentVo
	         ){
	      
	      // 댓글 목록 조회 
	      List<CommentVo> commentList = commentMapper.getCommentList(board_idx);
	      log.info("================commentList : {}", commentList);
	      return commentList;
	   }
	
	
	@PostMapping("/Api/Board/{board_idx}/commentCreate")
	@ResponseBody
	@Transactional
	public List<CommentVo> commentCreate (
			@PathVariable Long board_idx
		 ,@RequestBody CommentVo commentVo
			){
		
		// 댓글 목록 조회 
		List<CommentVo> commentList = commentMapper.getCommentList(board_idx);
		
		// 댓글 생성
		commentVo.setBoard_idx(board_idx);
		commentVo.setBoard_comment_idx(commentVo.getBoard_comment_idx());
		commentVo.setBoard_comment_like_idx(commentVo.getBoard_comment_like_idx());
		
		commentMapper.insertComment(commentVo);
		//commentMapper.addLikes(commentVo);

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
	
	
	//==================댓글 좋아요
	//==================댓글 좋아요
	//==================댓글 좋아요
	//==================댓글 좋아요
	//==================댓글 좋아요
	//==================댓글 좋아요
	//@PostMapping("/Api/Board/{board_idx}/{board_comment_idx}/{board_comment_like_idx}/addLike")
	@PostMapping("/Api/Board/{board_idx}/{board_comment_idx}/addLike")
	@ResponseBody
	//public ResponseEntity<String> AddLike(@PathVariable Long board_idx 
	public ResponseEntity<String> AddLike(
			@PathVariable Long board_idx 
	         ,@PathVariable Long board_comment_idx
	        // ,@PathVariable Long board_comment_like_idx
	 		 ,@RequestBody CommentVo commentVo) {
		commentVo.setBoard_idx(board_idx);
	    commentVo.setBoard_comment_idx(board_comment_idx);
		   
		//CommentVo comment_likes = commentMapper.selectLikes(commentVo);
		CommentVo existingLike  = commentMapper.selectLikes(commentVo);
		//CommentVo comment = commentMapper.selectLikes(commentVo);
		log.info("11111111111111111111111111111111");
		log.info("=========comment_likes",existingLike );
		//log.info("=========comment",comment);
		log.info("=========commentVo",commentVo);
	       
	      if(existingLike  != null) {
	    	   log.info(1 + "북마크가 존재함");
	          commentMapper.updateLikes(commentVo);
	          return ResponseEntity.ok("북마크가 존재함 update");
	    /*      if(comment != null) {
	        	  log.info(1 + "북마크가 존재함");
	        	  commentMapper.updateLikes(commentVo);
	        	  return ResponseEntity.ok("북마크가 존재함 update");*/
	          
	       }else {
	    	   log.info(2 + "북마크가 존재안함"); 
	          commentMapper.addLikes(commentVo); //insert
	          log.info("=========commentVo",commentVo);
	          return ResponseEntity.ok("북마크가 존재안함 insert");
	       }
	   }

	//@PostMapping("/Api/Board/{board_idx}/{board_comment_idx}/{board_comment_like_idx}/updateLike")
	@PostMapping("/Api/Board/{board_idx}/{board_comment_idx}/updateLike")
	   
	   public ResponseEntity<String> UpdateLike(
			   @PathVariable Long board_idx 
		         ,@PathVariable Long board_comment_idx
		       //  ,@PathVariable Long board_comment_like_idx
		 		 ,@RequestBody CommentVo commentVo) {
	      
		CommentVo comment_likes = commentMapper.selectLikes(commentVo);
		//CommentVo comment = commentMapper.selectLikes(commentVo);
	      
	     if(comment_likes != null) {
	         System.out.println(1 + "북마크가 존재함");
	         commentMapper.updateLikes(comment_likes); 
	         return ResponseEntity.ok("북마크가 존재함 update");
	    /*     if(comment != null) {
	        	 System.out.println(1 + "북마크가 존재함");
	        	 commentMapper.updateLikes(commentVo); 
	        	 return ResponseEntity.ok("북마크가 존재함 update");*/
	         
	      }else {
	         System.out.println(2 + "북마크가 존재안함"); 
	         commentMapper.addLikes(commentVo);
	         System.out.println(commentVo);
	         return ResponseEntity.ok("북마크가 존재안함 insert");
	      }
	   }
	

	@PostMapping("/Api/Board/{board_idx}/{board_comment_idx}/deletelike")
	//@PostMapping("/Api/Board/{board_comment_like_idx}/deleteLike")
	//@PostMapping("/Api/Board/{board_idx}/{board_comment_idx}/{board_comment_like_idx}/deleteLike")
	@ResponseBody
	   public ResponseEntity<String> DeleteLike(
			   @PathVariable Long board_idx 
		         ,@PathVariable Long board_comment_idx
		       //  ,@PathVariable Long board_comment_like_idx
		 		 ,@RequestBody CommentVo commentVo) {
		
		commentVo.setBoard_idx(board_idx);
	    commentVo.setBoard_comment_idx(board_comment_idx);
	   
	   CommentVo existingLike  = commentMapper.selectLikes(commentVo);	
	  // CommentVo comment = commentMapper.selectLikes(commentVo);	
	       
	      if(existingLike  != null) {
	    	  commentMapper.deleteLikes(commentVo);
	         return ResponseEntity.ok("delete");
	         
	       /*  if(comment != null) {
	         }
	        	 commentMapper.deleteLikes(commentVo);
	        	 return ResponseEntity.ok("delete");
	         */
	      }else {
	         return    ResponseEntity.badRequest().body("해당 북마크가 존재하지 않습니다.");
	      }
	       
	   }
	
}
