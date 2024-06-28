package com.escape.domain;

import java.util.List;

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
	String image;
	int rate;
	int count;

}
