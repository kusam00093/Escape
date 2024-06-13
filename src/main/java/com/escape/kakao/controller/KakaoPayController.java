package com.escape.kakao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.escape.kakao.domain.PaymentVo;
import com.escape.kakao.service.KakaoPayService;

@Controller
public class KakaoPayController {

    @Autowired
    private KakaoPayService kakaoPayService;

    @GetMapping("/kakaoPay")
    @ResponseBody
    public String kakaoPay() {
        return kakaoPayService.readyToPay();
    }

    @GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess() {
        // 결제 성공 로직 구현
        PaymentVo payment = new PaymentVo();
        //payment.setOrderId("1001");
        //payment.setUserId("user01");
        //payment.setAmount(1000);
        
//        payment.setApply_idx(1);
//        
//        private int apply_idx;
//        private int card_idx;
//        private int user_idx;
//        private int package_idx;
//        private int room_idx;
//        private int airplane_time_idx;
//        private int state;
//        private int apply_su;
//        private String created;

        kakaoPayService.savePayment(payment);
    	
        return "success";
    }

    @GetMapping("/kakaoPayCancel")
    public String kakaoPayCancel() {
        // 결제 취소 로직 구현
        return "cancel";
    }

    @GetMapping("/kakaoPayFail")
    public String kakaoPayFail() {
        // 결제 실패 로직 구현
        return "fail";
    }
    
}
