package com.escape.board.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentVo {
	private Long board_comment_idx;
	private Long board_idx;
	private String content;
	private String created;

}
