package com.escape.login.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Hotel {
	private int hotel_idx;
	private int user_idx;
	private String name;
	private String phone;
	private String zip_code;
	private String address1;
	private String address2;
	private String detail1;
	private String detail2;
	private String detail3;
	private int hit;

}