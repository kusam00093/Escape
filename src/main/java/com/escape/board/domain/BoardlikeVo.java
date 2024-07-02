package com.escape.board.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardlikeVo {
	private Long board_like_idx;
	private Long  board_idx;
	private int  user_idx;
}
