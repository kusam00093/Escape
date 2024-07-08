package com.escape.login.domain;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Pkg {
	private int package_idx;
	private int user_idx;
	private String title;
	private int package_category_idx;
	private String start_date;
	private String end_date;
	private int limited_person;
	private String price;
	private String detail1;
	private String detail2;
	private String detail3;
	private String zip_code;
	private String address1;
	private String address2;
	private int ptype_idx;
	private int hit;
	
	private int reservation_su;
	private int reservation_price;
	private String created;
	
	private String first_name;
    private String last_name;
    private int social_num;
    private String phone;
	
	
  

}