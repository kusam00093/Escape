package com.escape.accommodation.service;

import org.springframework.beans.factory.annotation.Value;
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

@Service("hotelNaverPayService")
public class NaverPayService {

    @Value("${naverpay.api.hotel.client.id}")
    private String clientId;

    @Value("${naverpay.api.hotel.client.secret}")
    private String clientSecret;

    @Value("${naverpay.api.hotel.url}")
    private String apiUrl;

    @Value("${naverpay.api.hotel.return.url}")
    private String returnUrl;

    @Value("${naverpay.api.hotel.cancel.url}")
    private String cancelUrl;

    @Value("${naverpay.api.hotel.fail.url}")
    private String failUrl;

    public String initiatePayment(int amount, String orderId, String itemName) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new FormHttpMessageConverter());
        restTemplate.getMessageConverters().add(new StringHttpMessageConverter());
           
        HttpHeaders headers = new HttpHeaders();
        headers.set("X-Naver-Client-Id", clientId);
        headers.set("X-Naver-Client-Secret", clientSecret);
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("amount", String.valueOf(amount));
        params.add("merchantPayKey", orderId);
        params.add("productName", itemName);
        params.add("returnUrl", returnUrl);
        params.add("cancelUrl", cancelUrl);
        params.add("failUrl", failUrl);

        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, headers);

        // 디버깅 로그 추가
        System.out.println("NaverPay request params: " + params);
        System.out.println("NaverPay request headers: " + headers);

        try {
            ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.POST, entity, String.class);
            // 디버깅 로그 추가
            System.out.println("NaverPay response: " + response.getBody());

            // 결제 예약 ID 추출
            String reservationId = extractReservationId(response.getBody());

            // 결제 페이지 URL 생성
            String paymentPageUrl = "https://test-m.pay.naver.com/payments/" + reservationId;

            return paymentPageUrl;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("NaverPay initiation failed: " + e.getMessage());
        }
    }
    
    private String extractReservationId(String responseBody) {
        // JSON 파싱을 통해 결제 예약 ID 추출
        // 실제 구현은 응답 포맷에 따라 다릅니다.
        // 예: JSONObject jsonObject = new JSONObject(responseBody);
        //     return jsonObject.getString("reservationId");
        return ""; // 임시로 빈 문자열 반환
    }
}
