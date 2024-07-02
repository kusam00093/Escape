package com.escape.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PackageVo2 {
	private  int package_idx;
	private int user_idx;
	private String title;
	private  String start_date;
	private  String end_date;
	private int limited_person;
	private String price;
	private String detail1;
	private String detail2;
	private String detail3;
	private String zip_code;
	private String address1;
	private String address2;
	private int    hit;
	private String created;

}
