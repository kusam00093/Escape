package com.escape.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PackageVo {
	int package_idx;
	int user_idx;
	String duration;
	String title;
	String start_date;
	String end_date;
	int limited_person;
	String price;
	String detail1;
	String detail2;
	String detail3;
	String zip_code;
	String address1;
	String address2;
	int ptype_idx;
	int hit;
	int category;
}
