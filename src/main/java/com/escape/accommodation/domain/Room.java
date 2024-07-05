package com.escape.accommodation.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Room {
	private int room_idx;
	private int hotel_idx;
	private String title;
	private int max_person;
	private String check_in_time;
	private String check_out_time;
	private int ptype_idx;
	private int price;
	private int available_rooms;
}
