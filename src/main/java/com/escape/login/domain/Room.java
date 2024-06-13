package com.escape.login.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Room {
	private int room_idx;
	private int hotel_idx;
	private String title;
	private String price;
	private int max_person;
	private String check_in;
	private String check_out;
	private String available_date;
	private int ptype_idx;

}