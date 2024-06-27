package com.escape.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Package_RateVo {
	int package_rate_idx;
	int package_review_idx;
	int user_idx;
	int rate;
}
