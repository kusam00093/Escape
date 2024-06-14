package com.escape.login.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	
    private int user_idx;
    private String id;
    private String passwd;
    private String email;
    private int type;

}