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
				@RequestParam Map<Object, Object> params
			) {
		
		System.out.println("===== AirplanePay === params: " + params);
		
		int user_idx = airplaneMapper.getUserIdx( params.get("userId") );
		System.out.println("===== Airplane/AirplanePay === user_idx: " + user_idx);
		
		String orderId = (String) params.get("orderId");
		String userId = (String) params.get("userId");
		String itemName = (String) params.get("itemName");
		String seatClass = (String) params.get("seatClass");
		String adultCount = (String) params.get("adultCount");
		String childCount = (String) params.get("childCount");
		String infantCount = (String) params.get("infantCount");
		int totalCount = Integer.parseInt( adultCount ) + Integer.parseInt( childCount ) + Integer.parseInt( infantCount );
		String adultPrice = (String) params.get("adultPrice");
		String childPrice = (String) params.get("childPrice");
		String infantPrice = (String) params.get("infantPrice");
		String totalPrice = (String) params.get("totalPrice");

		System.out.println("===== AirplanePay === orderId: " + orderId);
		System.out.println("===== AirplanePay === userId: " + userId);
		System.out.println("===== AirplanePay === itemName: " + itemName);
		System.out.println("===== AirplanePay === seatClass: " + seatClass);
		System.out.println("===== AirplanePay === adultCount: " + adultCount);
		System.out.println("===== AirplanePay === childCount: " + childCount);
		System.out.println("===== AirplanePay === infantCount: " + infantCount);
		System.out.println("===== AirplanePay === totalCount: " + totalCount);
		System.out.println("===== AirplanePay === adultPrice: " + adultPrice);
		System.out.println("===== AirplanePay === childPrice: " + childPrice);
		System.out.println("===== AirplanePay === infantPrice: " + infantPrice);
		System.out.println("===== AirplanePay === totalPrice: " + totalPrice);
		
		kakaoPayService.readyToPay(orderId, userId, itemName, seatClass, adultCount, childCount, infantCount, totalPrice, user_idx);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("orderId", orderId);
		mv.addObject("userId", userId);
		mv.addObject("user_idx", user_idx);
		mv.addObject("itemName", itemName);
		mv.addObject("seatClass", seatClass);
		mv.addObject("adultCount", adultCount);
		mv.addObject("childCount", childCount);
		mv.addObject("infantCount", infantCount);
		mv.addObject("totalCount", totalCount);
		mv.addObject("adultPrice", adultPrice);
		mv.addObject("childPrice", childPrice);
		mv.addObject("infantPrice", infantPrice);
		mv.addObject("totalPrice", totalPrice);
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