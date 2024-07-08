package com.escape.airplane.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.escape.airplane.domain.AirplaneTimeVo;
import com.escape.airplane.domain.AirplaneVo;
import com.escape.airplane.mapper.AirplaneMapper;
import com.escape.kakao.domain.PaymentVo;
import com.escape.kakao.service.KakaoPayService;
import com.escape.login.domain.User;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/Airplane")
public class AirplaneController {

	@Autowired
	private AirplaneMapper airplaneMapper;
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@RequestMapping("/Main")
	public ModelAndView main( AirplaneVo airplaneVo, HttpServletRequest request, User user ) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("airplane/airplanemain");
		return mv;
		
	}
	
	@RequestMapping("/Search")
    @ResponseBody
    public ModelAndView search( @RequestParam Map<String, Object> params, AirplaneTimeVo airplaneTimeVo ) {

		String id = (String) params.get("id");
		String depCity1 = (String) params.get("depCity1");
        String depCity2 = (String) params.get("depCity2");
        String arrCity1 = (String) params.get("arrCity1");
        String arrCity2 = (String) params.get("arrCity2");
        String depCityCode1 = (String) params.get("depCityCode1");
        String depCityCode2 = (String) params.get("depCityCode2");
        String arrCityCode1 = (String) params.get("arrCityCode1");
        String arrCityCode2 = (String) params.get("arrCityCode2");
        String depDate = (String) params.get("depDate");
        String arrDate = (String) params.get("arrDate");
        String initform = (String) params.get("initform");
        String seatClass = (String) params.get("seatClass");
        int stype = Integer.parseInt( (String) params.get("stype") );
        int adultCount = Integer.parseInt( (String) params.get("adultCount") );
        int childCount = Integer.parseInt( (String) params.get("childCount") );
        int infantCount = Integer.parseInt( (String) params.get("infantCount") );
		
        ModelAndView mv = new ModelAndView();
        mv.addObject("params", params);
        mv.addObject("id", id);
        mv.addObject("depCity1", depCity1);
        mv.addObject("depCity2", depCity2);
        mv.addObject("arrCity1", arrCity1);
        mv.addObject("arrCity2", arrCity2);
        mv.addObject("depCityCode1", depCityCode1);
        mv.addObject("depCityCode2", depCityCode2);
        mv.addObject("arrCityCode1", arrCityCode1);
        mv.addObject("arrCityCode2", arrCityCode2);
        mv.addObject("depDate", depDate);
        mv.addObject("arrDate", arrDate);
        mv.addObject("initform", initform);
        mv.addObject("seatClass", seatClass);
        mv.addObject("stype", stype);
        mv.addObject("adultCount", adultCount);
        mv.addObject("childCount", childCount);
        mv.addObject("infantCount", infantCount);
        mv.setViewName("airplane/airplanesearch");
        return mv;
        
    }
	
	@RequestMapping("/AirplanePay")
    public ModelAndView airplanepay(
        @RequestParam Map<Object, Object> params,
        AirplaneTimeVo airplaneTimeVo
    ) {

        System.out.println("===== AirplanePay === params: " + params);

        int user_idx = airplaneMapper.getUserIdx(params.get("userId"));
        System.out.println("===== Airplane/AirplanePay === user_idx: " + user_idx);

        int orderId1 = Integer.parseInt((String) params.get("orderId1"));
        int orderId2 = Integer.parseInt((String) params.get("orderId2"));
        String userId = (String) params.get("userId");
        String itemName1 = (String) params.get("itemName1");
        String itemName2 = (String) params.get("itemName2");
        String seatClass = (String) params.get("seatClass");
        int stype = Integer.parseInt((String) params.get("stype"));
        int adultCount = Integer.parseInt((String) params.get("adultCount"));
        int childCount = Integer.parseInt((String) params.get("childCount"));
        int infantCount = Integer.parseInt((String) params.get("infantCount"));
        int totalCount = adultCount + childCount + infantCount;
        String initform = (String) params.get("initform");

        // ptype_idx 별 가격 계산
        int adultPrice = airplaneMapper.getPriceInfo(orderId1, 1, stype) * adultCount;
        int childPrice = airplaneMapper.getPriceInfo(orderId1, 2, stype) * childCount;
        int infantPrice = airplaneMapper.getPriceInfo(orderId1, 3, stype) * infantCount;
        String totalPrice = (String) params.get("totalPrice");
        
        System.out.println("===== AirplanePay === orderId1: " + orderId1);
		System.out.println("===== AirplanePay === orderId2: " + orderId2);
		System.out.println("===== AirplanePay === userId: " + userId);
		System.out.println("===== AirplanePay === itemName1: " + itemName1);
		System.out.println("===== AirplanePay === itemName2: " + itemName2);
		System.out.println("===== AirplanePay === seatClass: " + seatClass);
		System.out.println("===== AirplanePay === stype: " + stype);
		System.out.println("===== AirplanePay === adultCount: " + adultCount);
		System.out.println("===== AirplanePay === childCount: " + childCount);
		System.out.println("===== AirplanePay === infantCount: " + infantCount);
		System.out.println("===== AirplanePay === totalCount: " + totalCount);
		System.out.println("===== AirplanePay === initform: " + initform);
		System.out.println("===== AirplanePay === adultPrice: " + adultPrice);
		System.out.println("===== AirplanePay === childPrice: " + childPrice);
		System.out.println("===== AirplanePay === infantPrice: " + infantPrice);
		System.out.println("===== AirplanePay === totalPrice: " + totalPrice);

        String paymentUrl = kakaoPayService.readyToPay(orderId1, orderId2, userId, itemName1, itemName2, seatClass, adultCount, childCount, infantCount, totalPrice, user_idx, airplaneTimeVo );

        ModelAndView mv = new ModelAndView();
        mv.addObject("orderId1", orderId1);
        mv.addObject("orderId2", orderId2);
        mv.addObject("userId", userId);
        mv.addObject("user_idx", user_idx);
        mv.addObject("itemName1", itemName1);
        mv.addObject("itemName2", itemName2);
        mv.addObject("seatClass", seatClass);
        mv.addObject("adultCount", adultCount);
        mv.addObject("childCount", childCount);
        mv.addObject("infantCount", infantCount);
        mv.addObject("totalCount", totalCount);
        mv.addObject("adultPrice", adultPrice);
        mv.addObject("childPrice", childPrice);
        mv.addObject("infantPrice", infantPrice);
        mv.addObject("totalPrice", totalPrice);
        mv.addObject("paymentUrl", paymentUrl); // 결제 URL 추가
        mv.setViewName("airplane/airplanepay");
        return mv;
    }

    @RequestMapping("/PaySuccess")
    @ResponseBody
    public ResponseEntity<Map<String, String>> PaySuccess(@RequestBody PaymentVo paymentVo) {
    	
        kakaoPayService.savePayment(paymentVo);

        Map<String, String> response = new HashMap<>();
        response.put("status", "success");

        return ResponseEntity.ok(response);
    }
	
}