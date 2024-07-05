package com.escape.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PackageVo {
	private int package_idx;
	private int user_idx;
	private 	String duration;
	private String title;
	private String start_date;
	private String end_date;
	private int limited_person;
	private 	String price;
	private 	String detail1;
	private String detail2;
	private String detail3;
	private String zip_code;
	private String address1;
	private String address2;
	private int ptype_idx;
	private int hit;
	private int category;
	private String image;
	private int package_image_idx;
	private int rate;
	private int count;
	private    String location_name;
	private   String category_name;
	private  int remaining_person;
    private   int package_discount_idx;
    private   int  state;
    private  int discount_percent;
    private    int discount_integer;
    private   int discounted_price;
    private   int created;

}
