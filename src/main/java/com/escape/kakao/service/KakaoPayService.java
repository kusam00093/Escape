package com.escape.kakao.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.escape.kakao.domain.PaymentVo;
import com.escape.kakao.mapper.PaymentMapper;

import org.springframework.http.converter.FormHttpMessageConverter;

@Service
public class KakaoPayService {

	@Autowired
	private PaymentMapper paymentMapper;

	@Value("${kakao.api.admin.key}")
	private String adminKey;

	@Value("${kakao.api.cid}")
	private String cid;

	@Value("${kakao.api.url}")
	private String kakaoPayUrl;

	public String readyToPay(String orderId, String userId, String itemName, String seatClass, String adultCount,
			String childCount, String infantCount, String totalPrice, int user_idx) {

		System.out.println("===== readyToPay === orderId:" + orderId);
		System.out.println("===== readyToPay === userId:" + userId);
		System.out.println("===== readyToPay === itemName:" + itemName);
		System.out.println("===== readyToPay === seatClass:" + seatClass);
		System.out.println("===== readyToPay === adultCount:" + adultCount);
		System.out.println("===== readyToPay === childCount:" + childCount);
		System.out.println("===== readyToPay === infantCount:" + infantCount);
		System.out.println("===== readyToPay === totalPrice:" + totalPrice);
		System.out.println("===== readyToPay === user_idx:" + user_idx);

		int totalCount = Integer.parseInt(adultCount) + Integer.parseInt(childCount) + Integer.parseInt(infantCount);

		RestTemplate restTemplate = new RestTemplate();
		// Add FormHttpMessageConverter to RestTemplate
		restTemplate.getMessageConverters().add(new FormHttpMessageConverter());
		System.out.println("===== readyToPay === restTemplate:" + restTemplate);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + adminKey);
		// headers.add("Content-Type", "application/json");
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		System.out.println("===== readyToPay === headers:" + headers);

		// Map<String, String> params = new HashMap<>();
//        params.put("cid", cid);
//        params.put("partner_order_id", orderId);
//        params.put("partner_user_id", userId);
//        params.put("item_name", itemName);
//        params.put("adultCount", String.valueOf(adultCount));
//        params.put("childCount", String.valueOf(childCount));
//        params.put("infantCount", String.valueOf(infantCount));
//        params.put("total_amount", String.valueOf(totalPrice));
//        params.put("tax_free_amount", "0");
//        params.put("approval_url", "http://localhost:9089/kakaoPaySuccess");
//        params.put("cancel_url", "http://localhost:9089/kakaoPayCancel");
//        params.put("fail_url", "http://localhost:9089/kakaoPayFail");
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", cid);
		//params.add("partner_order_id", orderId);
		//params.add("partner_order_id", String.valueOf(orderId));
		params.add("partner_order_id",  orderId.toString());
		params.add("partner_user_id", userId);
		params.add("item_name", itemName);
		params.add("adultCount", String.valueOf(adultCount));
		params.add("childCount", String.valueOf(childCount));
		params.add("infantCount", String.valueOf(infantCount));
		params.add("quantity", String.valueOf(totalCount));
		params.add("total_amount", String.valueOf(totalPrice));
		params.add("tax_free_amount", "0");
		params.add("approval_url", "http://localhost:9089/kakaoPaySuccess");
		params.add("cancel_url", "http://localhost:9089/kakaoPayCancel");
		params.add("fail_url", "http://localhost:9089/kakaoPayFail");
		System.out.println("===== readyToPay === params:" + params);

		// 파라미터 준비
		int quantity = Integer.parseInt(params.getFirst("quantity"));
		int totalAmount = Integer.parseInt(params.getFirst("total_amount"));
		

		// paymentMapper.insertReservation(params);
		Map<String, String> myBatisParams = new HashMap<>(params.toSingleValueMap());
		//paymentMapper.insertReservation(userId, orderId, quantity, totalAmount);
		paymentMapper.insertReservation(user_idx, orderId, quantity, totalAmount);

		// HttpEntity<Map<String, String>> entity = new HttpEntity<>(params, headers);
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, headers);
		System.out.println("===== readyToPay === entity:" + entity);

		ResponseEntity<String> response = restTemplate.exchange(kakaoPayUrl, HttpMethod.POST, entity, String.class);
		System.out.println("===== readyToPay === response:" + response);

		return response.getBody();

	}

	public void savePayment(PaymentVo payment) {

		paymentMapper.insertPayment(payment);

	}

}

//    public String readyToPay(
//	    		String orderId, 
//	    		String userId, 
//	    		String itemName, 
//	    		int totalCount, 
//	    		int totalPrice
//    		) {
//    	
//    	System.out.println("===== readyToPay === orderId:" + orderId);
//    	System.out.println("===== readyToPay === userId:" + userId);
//    	System.out.println("===== readyToPay === itemName:" + itemName);
//    	System.out.println("===== readyToPay === totalCount:" + totalCount);
//    	System.out.println("===== readyToPay === totalPrice:" + totalPrice);
//
//    	RestTemplate restTemplate = new RestTemplate();
//        System.out.println("===== readyToPay === restTemplate:" + restTemplate);
//
//        HttpHeaders headers = new HttpHeaders();
//        headers.add("Authorization", "KakaoAK " + adminKey);
//        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
//        System.out.println("===== readyToPay === headers:" + headers);
//
//        Map<String, String> params = new HashMap<>();
//        params.put("cid", cid);
//        params.put("partner_order_id", orderId);
//        params.put("partner_user_id", userId);
//        params.put("item_name", itemName);
//        params.put("quantity", String.valueOf(totalCount));
//        params.put("total_amount", String.valueOf(totalPrice));
//        params.put("tax_free_amount", "0");
//        params.put("approval_url", "http://localhost:9089/kakaoPaySuccess");
//        params.put("cancel_url", "http://localhost:9089/kakaoPayCancel");
//        params.put("fail_url", "http://localhost:9089/kakaoPayFail");
//        System.out.println("===== readyToPay === params:" + params);
//        
//        //paymentMapper.insertApply()
//
//        HttpEntity<Map<String, String>> entity = new HttpEntity<>(params, headers);
//        System.out.println("===== readyToPay === entity:" + entity);
//
//        ResponseEntity<String> response = restTemplate.exchange(
//	                kakaoPayUrl, 
//	                HttpMethod.POST, 
//	                entity, 
//	                String.class
//                );
//        System.out.println("===== readyToPay === response:" + response);
//
//        return response.getBody();
//        
//    }    

//package com.escape.kakao.service;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.http.HttpEntity;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpMethod;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Service;
//import org.springframework.web.client.RestTemplate;
//
//import com.escape.kakao.domain.PaymentVo;
//import com.escape.kakao.mapper.PaymentMapper;
//
//@Service
//public class KakaoPayService {
//	
//	@Autowired
//    private PaymentMapper paymentMapper;
//
//    @Value("${kakao.api.admin.key}")
//    private String adminKey;
//
//    @Value("${kakao.api.cid}")
//    private String cid;
//
//    @Value("${kakao.api.url}")
//    private String kakaoPayUrl;
//
//    public String readyToPay() {
//    	
//    	System.out.println("===== PayService === adminKey: " + adminKey);
//    	System.out.println("===== PayService === cid: " + cid);
//    	System.out.println("===== PayService === kakaoPayUrl: " + kakaoPayUrl);
//    	
//        RestTemplate restTemplate = new RestTemplate();
//
//        HttpHeaders headers = new HttpHeaders();
//        headers.add("Authorization", "KakaoAK " + adminKey);
//        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
//
//        Map<String, String> params = new HashMap<>();
//        params.put("cid", cid);
//        params.put("partner_order_id", "1001");  // 실제 주문 ID로 교체 필요
//        params.put("partner_user_id", "user01");  // 실제 사용자 ID로 교체 필요
//        params.put("item_name", "Sample Item");
//        params.put("quantity", "1");
//        params.put("total_amount", "1000");
//        params.put("vat_amount", "200");
//        params.put("tax_free_amount", "0");
//        params.put("approval_url", "http://localhost:9089/kakaoPaySuccess");
//        params.put("cancel_url", "http://localhost:9089/kakaoPayCancel");
//        params.put("fail_url", "http://localhost:9089/kakaoPayFail");
//
//        HttpEntity<Map<String, String>> entity = new HttpEntity<>(params, headers);
//
//        ResponseEntity<String> response = restTemplate.exchange(
//                kakaoPayUrl, HttpMethod.POST, entity, String.class);
//
//        return response.getBody();
//    }
//    
//    public void savePayment(PaymentVo payment) {
//        paymentMapper.insertPayment(payment);
//    }
//    
//}