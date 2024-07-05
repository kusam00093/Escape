package com.escape.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Package_ReservationVo {
	private int package_reservation_idx;
	private int user_idx;
	private int package_idx;
	private int reservation_su;
	private int reservation_price;
	private int state;
	private String created;
}
