package com.escape.kakao.service;

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
		restTemplate.getMessageConverters().add(new FormHttpMessageConverter());
		System.out.println("===== readyToPay === restTemplate:" + restTemplate);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + adminKey);
		// headers.add("Content-Type", "application/json");
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		System.out.println("===== readyToPay === headers:" + headers);

		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", cid);
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

		// INSERT INTO AIRPLANE_RESERVATION_TB
		int quantity = Integer.parseInt(params.getFirst("quantity"));
		int totalAmount = Integer.parseInt(params.getFirst("total_amount"));
		int existingRecords = paymentMapper.checkReservationExists(user_idx, orderId);
		System.out.println("===== readyToPay === existingRecords:" + existingRecords);
	    
	    if (existingRecords == 0) {
	        // 중복이 없으면 INSERT 수행
	        paymentMapper.insertReservation(user_idx, orderId, quantity, totalAmount);
	    } else {
	        // 이미 예약된 경우 처리 로직 추가
	        throw new DuplicateReservationException("이미 예약된 목록입니다.");
	    }

		//paymentMapper.insertReservation(user_idx, orderId, quantity, totalAmount);

		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, headers);
		System.out.println("===== readyToPay === entity:" + entity);

		ResponseEntity<String> response = restTemplate.exchange(kakaoPayUrl, HttpMethod.POST, entity, String.class);
		System.out.println("===== readyToPay === response:" + response);

		return response.getBody();

	}

	public void savePayment(PaymentVo payment) {

		paymentMapper.insertPayment(payment);
		//paymentMapper.updateReservation();	// status : 1 → 2

	}

}