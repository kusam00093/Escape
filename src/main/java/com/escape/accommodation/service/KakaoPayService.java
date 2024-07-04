package com.escape.accommodation.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.escape.accommodation.config.HotelKakaoPayConfig;

@Service("hotelKakaoPayService")
public class KakaoPayService {

    @Autowired
    private HotelKakaoPayConfig hotelKakaoPayConfig;

    public String initiatePayment(int amount, String orderId, String itemName) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new FormHttpMessageConverter());
        restTemplate.getMessageConverters().add(new StringHttpMessageConverter());

        String url = hotelKakaoPayConfig.getUrl();
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "KakaoAK " + hotelKakaoPayConfig.getKey());
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("cid", hotelKakaoPayConfig.getCid());
        params.add("partner_order_id", orderId);
        params.add("partner_user_id", "user_id");
        params.add("item_name", itemName);
        params.add("quantity", "1");
        params.add("total_amount", String.valueOf(amount));
        params.add("vat_amount", "0");
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost:9089/payment/success");
        params.add("cancel_url", "http://localhost:9089/payment/cancel");
        params.add("fail_url", "http://localhost:9089/payment/fail");

        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, headers);

        // 디버깅 로그 추가
        System.out.println("KakaoPay request params: " + params);
        System.out.println("KakaoPay request headers: " + headers);

        try {
            ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.POST, entity, Map.class);
            Map<String, Object> responseBody = response.getBody();
            return responseBody != null ? (String) responseBody.get("next_redirect_pc_url") : null;
        } catch (Exception e) {
            e.printStackTrace(); // 예외 로그 출력
            throw new RuntimeException("KakaoPay initiation failed: " + e.getMessage());
        }
    }
}
