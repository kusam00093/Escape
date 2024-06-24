package com.escape.login.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Airplane {
	private int airplane_idx;
    private int airline_idx;
    private String name;
    
    private int reservation_su;
    private int reservation_price;
    private String created;
    
	
}