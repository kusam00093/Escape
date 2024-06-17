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
	String image;
	int package_image_idx;
	int rate;
	int count;
    String location_name;
    String category_name;
    int remaining_person;
    int package_discount_idx;
    int  state;
    int discount_percent;
    int discount_integer;
    int discounted_price;
    int created;
}
