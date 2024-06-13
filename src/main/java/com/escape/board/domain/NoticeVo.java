package com.escape.board.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVo {
	 
	 private Long notice;
	 private Long user_idx;
	 private String title;
	 private String content;
	 private String created;
}