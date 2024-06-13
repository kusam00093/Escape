package com.escape.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Package_ReviewVo {
	int package_review_idx;
	int package_idx;
	String content;
	int person_idx;
	String created;
	String full_name;
	int rate;
	int count;
}
