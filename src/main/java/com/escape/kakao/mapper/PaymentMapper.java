package com.escape.kakao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.escape.kakao.domain.PaymentVo;

@Mapper
public interface PaymentMapper {

    @Insert("INSERT INTO payments (order_id, user_id, amount) VALUES (#{orderId}, #{userId}, #{amount})")
    void insertPayment(PaymentVo paymentVo);
}
