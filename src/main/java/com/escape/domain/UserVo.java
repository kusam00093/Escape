package com.escape.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVo {

	private int user_idx;
	private String email;
	private int point;
	private String last_name;
	private String first_name;
	private String phone;
}
