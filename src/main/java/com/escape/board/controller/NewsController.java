package com.escape.board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.escape.board.mapper.BoardMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NewsController {
	@Autowired
	private BoardMapper boardMapper;
	
	 @PostMapping("/Api/{news_idx}/updateNewsHit")
	    @ResponseBody
	    public ResponseEntity<Map<String, Long>> updateNewsHit(@RequestParam("news_idx") Long newsIdx) {
		 
	        boardMapper.updateNewsHit(newsIdx);
	        Long updatedHit = boardMapper.getNewsHit(newsIdx); // 업데이트된 조회수를 가져옴
	        Map<String, Long> response = new HashMap<>();
	        response.put("news_idx", newsIdx);
	        response.put("hitCount", updatedHit);
	        return new ResponseEntity<>(response, HttpStatus.OK); // 업데이트된 조회수를 반환
	    }
}
