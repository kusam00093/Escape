package com.escape.login.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Airplane_time {
    private int airplane_time_idx;
    private int airplane_idx;
    private String start_date;
	private String end_date;
	private String start_time;
	private String end_time;
	private int departure_loc;
	private int arrival_loc;
	private int known;
	
    private int airline_idx;
    private String name;
    
    private int reservation_su;
    private int reservation_price;
    private String created;
}