package com.escape.kakao.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentVo {
	
    //private String orderId;	// apply_idx
    //private String userId;	// user_idx
    //private int amount;	// apply_su
    
    private int apply_idx;
    private int card_idx;
    private int user_idx;
    private int package_idx;
    private int room_idx;
    private int airplane_time_idx;
    private int state;
    private int apply_su;
    private String created;
    
}
