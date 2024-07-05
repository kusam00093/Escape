package com.escape.login.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Room_reservation {
	private int room_reservation_idx;
	private int user_idx;
	private int room_idx;
	private int reservation_su;
	private int reservation_price;
	private int state;
	private String created;

}