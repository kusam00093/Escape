package com.escape.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DiscountVo {
	private int package_discount_idx;
	private int user_idx;
	private int package_idx;
	private int state;
	private int discount_percent;
	private int discount_integer;
	private String created;
}
