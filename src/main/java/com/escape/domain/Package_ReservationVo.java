package com.escape.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Package_ReservationVo {
	int package_reservation_idx;
	int user_idx;
	int package_idx;
	int reservation_su;
	int reservation_price;
	int state;
	String created;
}
