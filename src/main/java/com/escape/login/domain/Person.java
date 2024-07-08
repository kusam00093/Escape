package com.escape.login.domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Person {
    private int person_idx;
    private int user_idx;
    private String first_name;
    private String last_name;
    private int social_num;
    private String phone;
    private String zip_code;
    private String address1;
    private String address2;
    private String nickname;
    private String image;
    
    private int point;
	
    
    
}