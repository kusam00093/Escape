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
import org.springframework.web.client.RestTemplate;

import com.escape.kakao.domain.PaymentVo;
import com.escape.kakao.mapper.PaymentMapper;

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

    public String readyToPay() {
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + adminKey);
        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        Map<String, String> params = new HashMap<>();
        params.put("cid", cid);
        params.put("partner_order_id", "1001");  // 실제 주문 ID로 교체 필요
        params.put("partner_user_id", "user01");  // 실제 사용자 ID로 교체 필요
        params.put("item_name", "Sample Item");
        params.put("quantity", "1");
        params.put("total_amount", "1000");
        params.put("vat_amount", "200");
        params.put("tax_free_amount", "0");
        params.put("approval_url", "http://localhost:8080/kakaoPaySuccess");
        params.put("cancel_url", "http://localhost:8080/kakaoPayCancel");
        params.put("fail_url", "http://localhost:8080/kakaoPayFail");

        HttpEntity<Map<String, String>> entity = new HttpEntity<>(params, headers);

        ResponseEntity<String> response = restTemplate.exchange(
                kakaoPayUrl, HttpMethod.POST, entity, String.class);

        return response.getBody();
    }
    
    public void savePayment(PaymentVo payment) {
        paymentMapper.insertPayment(payment);
    }
    
}
