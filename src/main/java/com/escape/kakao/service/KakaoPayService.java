package com.escape.kakao.service;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.escape.airplane.domain.AirplaneTimeVo;
import com.escape.kakao.domain.PaymentVo;
import com.escape.kakao.mapper.PaymentMapper;

import com.escape.kakao.exception.DuplicateReservationException;

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

    public String readyToPay(int orderId1, int orderId2, String userId, String itemName1, String itemName2, String seatClass, int adultCount,
            int childCount, int infantCount, String totalPrice, int user_idx, AirplaneTimeVo airplaneTimeVo) {

    	System.out.println("airplaneTimeVo: " + airplaneTimeVo);
		System.out.println("Admin Key: " + adminKey);
		System.out.println("CID: " + cid);
		System.out.println("KakaoPay URL: " + kakaoPayUrl);
		
		int totalCount = adultCount + childCount + infantCount;
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", cid);
		params.add("partner_order_id", String.valueOf(orderId1));
		params.add("partner_user_id", userId);
		params.add("item_name", itemName1);
		params.add("quantity", String.valueOf(totalCount));
		params.add("total_amount", totalPrice);
		params.add("tax_free_amount", "0");
		params.add("approval_url", "http://localhost:9089/kakaoPaySuccess");
		params.add("cancel_url", "http://localhost:9089/kakaoPayCancel");
		params.add("fail_url", "http://localhost:9089/kakaoPayFail");
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + adminKey);
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, headers);
		
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getMessageConverters().add(new FormHttpMessageConverter());
		
		try {
			ResponseEntity<String> response = restTemplate.exchange(kakaoPayUrl, HttpMethod.POST, entity, String.class);
			System.out.println("Response: " + response);
			return new JSONObject(response.getBody()).getString("next_redirect_pc_url");
		} catch (HttpClientErrorException e) {
			System.out.println("HttpClientErrorException: " + e.getStatusCode() + " - " + e.getResponseBodyAsString());
			throw e;
		} catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
			throw e;
		}
	}
    
    public String readyToPay2(int orderId1, String userId, String itemName1, String seatClass, int adultCount,
    		int childCount, int infantCount, String totalPrice, int user_idx, AirplaneTimeVo airplaneTimeVo) {
    	
    	System.out.println("airplaneTimeVo: " + airplaneTimeVo);
    	System.out.println("Admin Key: " + adminKey);
    	System.out.println("CID: " + cid);
    	System.out.println("KakaoPay URL: " + kakaoPayUrl);
    	
    	int totalCount = adultCount + childCount + infantCount;
    	
    	MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
    	params.add("cid", cid);
    	params.add("partner_order_id", String.valueOf(orderId1));
    	params.add("partner_user_id", userId);
    	params.add("item_name", itemName1);
    	params.add("quantity", String.valueOf(totalCount));
    	params.add("total_amount", totalPrice);
    	params.add("tax_free_amount", "0");
    	params.add("approval_url", "http://localhost:9089/kakaoPaySuccess");
    	params.add("cancel_url", "http://localhost:9089/kakaoPayCancel");
    	params.add("fail_url", "http://localhost:9089/kakaoPayFail");
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", "KakaoAK " + adminKey);
    	headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
    	
    	HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, headers);
    	
    	RestTemplate restTemplate = new RestTemplate();
    	restTemplate.getMessageConverters().add(new FormHttpMessageConverter());
    	
    	try {
    		ResponseEntity<String> response = restTemplate.exchange(kakaoPayUrl, HttpMethod.POST, entity, String.class);
    		System.out.println("Response: " + response);
    		return new JSONObject(response.getBody()).getString("next_redirect_pc_url");
    	} catch (HttpClientErrorException e) {
    		System.out.println("HttpClientErrorException: " + e.getStatusCode() + " - " + e.getResponseBodyAsString());
    		throw e;
    	} catch (Exception e) {
    		System.out.println("Exception: " + e.getMessage());
    		throw e;
    	}
    }

	//-------------------------------------------------------------------------------------------------------
    
    public void savePayment(PaymentVo paymentVo, int orderId1, int orderId2, String userId, int user_idx, 
            String itemName1, String itemName2, int totalCount, int totalPrice, int price1, int price2) {

		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", cid);
		params.add("partner_order_id", String.valueOf(orderId1));
		params.add("partner_order_id2", String.valueOf(orderId2));
		params.add("partner_user_id", userId);
		params.add("item_name", itemName1);
		params.add("item_name2", itemName2);
		params.add("quantity", String.valueOf(totalCount));
		params.add("total_amount1", String.valueOf(price1));
		params.add("total_amount2", String.valueOf(price2));
		params.add("tax_free_amount", "0");
		params.add("approval_url", "http://localhost:9089/kakaoPaySuccess");
		params.add("cancel_url", "http://localhost:9089/kakaoPayCancel");
		params.add("fail_url", "http://localhost:9089/kakaoPayFail");
		
		int quantity = Integer.parseInt(params.getFirst("quantity"));
		int totalAmount1 = Integer.parseInt(params.getFirst("total_amount1"));
		int totalAmount2 = Integer.parseInt(params.getFirst("total_amount2"));
		int existingRecords1 = paymentMapper.checkReservationExists(user_idx, orderId1);
		int existingRecords2 = paymentMapper.checkReservationExists(user_idx, orderId2);
		
		if (existingRecords1 > 0 || existingRecords2 > 0) {
			throw new DuplicateReservationException("이미 예약된 목록입니다.");
		}
		
		if (existingRecords1 == 0) {
			paymentMapper.insertReservation(user_idx, orderId1, quantity, totalAmount1);
			paymentMapper.updateReservation(orderId1);  // status : 1 → 2
			
			int reservationIdx = paymentMapper.getReservationIdx1(paymentVo);
			System.out.println("===== savePayment === Reservationidx: " + reservationIdx);
			
			paymentMapper.insertPayment1(paymentVo, reservationIdx);
		}
		
		if (existingRecords2 == 0) {
			paymentMapper.insertReservation(user_idx, orderId2, quantity, totalAmount2);
			paymentMapper.updateReservation(orderId2);  // status : 1 → 2
			
			int reservationIdx = paymentMapper.getReservationIdx2(paymentVo);
			System.out.println("===== savePayment === Reservationidx: " + reservationIdx);
			
			paymentMapper.insertPayment2(paymentVo, reservationIdx);
		}
		
	}
    
    public void savePayment2(PaymentVo paymentVo, int orderId1, String userId, int user_idx, 
    		String itemName1, int totalCount, int totalPrice, int price1) {
    	
    	MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
    	params.add("cid", cid);
    	params.add("partner_order_id", String.valueOf(orderId1));
    	params.add("partner_user_id", userId);
    	params.add("item_name", itemName1);
    	params.add("quantity", String.valueOf(totalCount));
    	params.add("total_amount1", String.valueOf(price1));
    	params.add("tax_free_amount", "0");
    	params.add("approval_url", "http://localhost:9089/kakaoPaySuccess");
    	params.add("cancel_url", "http://localhost:9089/kakaoPayCancel");
    	params.add("fail_url", "http://localhost:9089/kakaoPayFail");
    	
    	int quantity = Integer.parseInt(params.getFirst("quantity"));
    	int totalAmount1 = Integer.parseInt(params.getFirst("total_amount1"));
    	int existingRecords1 = paymentMapper.checkReservationExists(user_idx, orderId1);
    	
    	if (existingRecords1 > 0) {
    		throw new DuplicateReservationException("이미 예약된 목록입니다.");
    	}
    	
    	if (existingRecords1 == 0) {
    		paymentMapper.insertReservation(user_idx, orderId1, quantity, totalAmount1);
    		paymentMapper.updateReservation(orderId1);  // status : 1 → 2
    		
    		int reservationIdx = paymentMapper.getReservationIdx1(paymentVo);
    		System.out.println("===== savePayment === Reservationidx: " + reservationIdx);
    		
    		paymentMapper.insertPayment1(paymentVo, reservationIdx);
    	}
    	
    }

}