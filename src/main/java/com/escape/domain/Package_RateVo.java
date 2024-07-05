package com.escape.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Package_RateVo {
	private int package_rate_idx;
	private int package_review_idx;
	private int user_idx;
	private int rate;
}
