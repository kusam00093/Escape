package com.escape.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.escape.board.domain.BoardlikeVo;
import com.escape.board.mapper.BoardLikeMapper;
import com.escape.board.mapper.BoardMapper;
import com.escape.login.domain.User;
import com.escape.login.mapper.UserMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardLikeController {
	
	@Autowired
    private BoardLikeMapper boardLikeMapper;
	@Autowired
	private BoardMapper boardMapper;
	@Autowired
	private UserMapper userMapper;
	
	
	@PostMapping("/Api/Board/{board_idx}/{user_idx}/addBlike")
	   @ResponseBody
	   public ResponseEntity<String> AddBlike(
	             @PathVariable Long board_idx 
	           //  , @RequestParam(value="id") String id
	             ,@RequestParam(value="user_idx") int user_idx
	           // ,@PathVariable int user_idx
	           // ,@PathVariable Long board_like_idx
	           ,@RequestBody BoardlikeVo boardlikeVo
	           ,@RequestBody User user
	           ) {
	     
		   //user.getUser_idx();

		   
		   List<User> userList = boardMapper.getUserList(user);
		   int userIdx = userList.get(0).getUser_idx();
		   System.out.println("=======================boardlikeVo:"+userList);
	         
	          
		   BoardlikeVo existingBlike  = boardLikeMapper.selectBlike(user_idx);
		   System.out.println("===============addLike === existingBlike: " + userIdx);
		   System.out.println("===============addLike === existingBlike: " + user_idx);
		   System.out.println("===============addLike === existingBlike: " + existingBlike);
	         if(existingBlike  != null) {
	             log.info(1 + "북마크가 존재함");
	             //commentMapper.updateLikes(commentVo);
	             boardLikeMapper.deleteBlike(boardlikeVo);
	             return ResponseEntity.ok("북마크가 존재함 delete");
	       /*      if(comment != null) {
	                log.info(1 + "북마크가 존재함");
	                commentMapper.updateLikes(commentVo);
	                return ResponseEntity.ok("북마크가 존재함 update");*/
	             
	          }else {
	             log.info(2 + "북마크가 존재안함"); 
	             /////////////////////////////////////////
	             boardLikeMapper.addBlike(boardlikeVo); //insert
	            // commentMapper.addCLikes(commentVo); //insert
	             log.info("=========boardlikeVo",boardlikeVo);
	             return ResponseEntity.ok("북마크가 존재안함 insert");
	          }
	      }
	
	
	   @PostMapping("/Api/Board/{board_idx}/{user_idx}/deleteBlike")
	   @ResponseBody
	      public ResponseEntity<String> DeleteBlike(
	    		     @PathVariable Long board_idx 
	    		  //   ,@RequestParam(value="user_idx") int user_idx
		            ,@PathVariable int user_idx
		          //  ,@PathVariable Long board_like_idx
		           ,@RequestBody BoardlikeVo boardlikeVo
		           //,@RequestBody User user
		           ) {
	      
	      
	       boardlikeVo.setBoard_idx(board_idx);
	       System.out.println("======deleteBlike == board_idx: " + board_idx);
	      // user.getUser_idx();
		   //boardlikeVo.setBoard_like_idx(board_like_idx);
		   //List<User> userList = boardMapper.getUserList(user);
		   //int userIdx = userList.get(0).getUser_idx();
	       
	       boardLikeMapper.deleteBlike(boardlikeVo);
	     
	          return ResponseEntity.ok("delete");
	          
	      }
}
