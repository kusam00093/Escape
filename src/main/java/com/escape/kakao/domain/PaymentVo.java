package com.escape.kakao.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentVo {
	
	// APPLY_TB
    private int apply_idx;
    private int user_idx;
    private int package_idx;
    private int room_idx;
    private int airplane_time_idx;
    private int apply_su;
    private int state;
    private String created;

    // CARD_TB
    private int card_idx;

}
