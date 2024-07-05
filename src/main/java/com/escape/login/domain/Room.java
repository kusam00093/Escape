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
	private int max_preson;
	private String check_in;
	private String check_out;
	private String available_date;
	private int ptype_idx;

	private int reservation_price;
	private int reservation_su;
	private String created;
	
	private String first_name;
    private String last_name;
    private int social_num;
    private String phone;
}