package com.escape.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Package_ReviewVo {
	private int package_review_idx;
	private int package_idx;
	private String content;
	private int person_idx;
	private String created;
	private String full_name;
	private String image;
	private int rate;
	private int count;

}
