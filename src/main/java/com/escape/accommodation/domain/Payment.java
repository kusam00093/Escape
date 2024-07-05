package com.escape.accommodation.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payment {    
	private int room_pay_idx;
	private int user_idx;
	private int room_reservation_idx;
	private int price;
	private int state;
	private LocalDateTime created;
}
