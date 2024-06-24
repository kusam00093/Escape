package com.escape.kakao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.escape.kakao.domain.PaymentVo;
import com.escape.kakao.service.KakaoPayService;

@Controller
public class KakaoPayController {

    @Autowired
    private KakaoPayService kakaoPayService;

//    @GetMapping("/kakaoPay")
//    @ResponseBody
//    public String kakaoPay(
//	    		@RequestParam String orderId, 
//	    		@RequestParam String userId, 
//	    		@RequestParam String itemName,
//	            @RequestParam int totalCount, 
//	            @RequestParam int totalPrice
//            ) {
//    	
//        return kakaoPayService.readyToPay(orderId, userId, itemName, totalCount, totalPrice);
//        
//    }
    
    //----------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(
	    		@RequestParam int applyIdx, 
	    		@RequestParam int cardIdx, 
	    		@RequestParam int userIdx,
	    		@RequestParam int packageIdx, 
	    		@RequestParam int roomIdx, 
	    		@RequestParam int airplaneTimeIdx,
	    		@RequestParam int state, 
	    		@RequestParam int applySu, 
	    		@RequestParam String created
    		) {
    	
        PaymentVo payment = new PaymentVo();
        
        //payment.setApply_idx(applyIdx);
        //payment.setCard_idx(cardIdx);
        payment.setUser_idx(userIdx);
        //payment.setPackage_idx(packageIdx);
        //payment.setRoom_idx(roomIdx);
        payment.setAirplane_time_idx(airplaneTimeIdx);
        payment.setState(state);
        //payment.setApply_su(applySu);
        payment.setCreated(created);

        kakaoPayService.savePayment(payment);
    	
        return "success";
        
    }
    
    //----------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/kakaoPayCancel")
    public String kakaoPayCancel() {
        return "cancel";
    }
    
    //----------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/kakaoPayFail")
    public String kakaoPayFail() {
        return "fail";
    }
}


//package com.escape.kakao.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.escape.kakao.domain.PaymentVo;
//import com.escape.kakao.service.KakaoPayService;
//
//@Controller
//public class KakaoPayController {
//
//    @Autowired
//    private KakaoPayService kakaoPayService;
//
//    @GetMapping("/kakaoPay")
//    @ResponseBody
//    public String kakaoPay() {
//    	
//        return kakaoPayService.readyToPay();
//        
//    }
//
//    // 결제 성공 로직 구현
//    @GetMapping("/kakaoPaySuccess")
//    public String kakaoPaySuccess() {
//    	
//        PaymentVo payment = new PaymentVo();
//        
//        payment.setApply_idx(1);
//        payment.setCard_idx(1);
//        payment.setUser_idx(1);
//        payment.setPackage_idx(1);
//        payment.setRoom_idx(1);
//        payment.setAirplane_time_idx(1);
//        payment.setState(1);
//        payment.setApply_su(1);
//        payment.setCreated("1");
//
//        kakaoPayService.savePayment(payment);
//    	
//        return "success";
//        
//    }
//
//    // 결제 취소 로직 구현
//    @GetMapping("/kakaoPayCancel")
//    public String kakaoPayCancel() {
//        return "cancel";
//    }
//
//    // 결제 실패 로직 구현
//    @GetMapping("/kakaoPayFail")
//    public String kakaoPayFail() {
//        return "fail";
//    }
//    
//}