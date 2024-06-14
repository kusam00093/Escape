package com.escape.kakao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.escape.kakao.domain.PaymentVo;

@Mapper
public interface PaymentMapper {

    @Insert(
            "INSERT INTO AIRPLANE_RESERVATION_TB ( " +
            "AIRPLANE_RESERVATION_IDX, " +
            "USER_IDX, " +
            "AIRPLANE_TIME_IDX, " +
            "RESERVATION_SU, " +
            "RESERVATION_PRICE, " +
            "STATE, " +
            "CREATED " +
            ") VALUES ( " +
            "(SELECT NVL(MAX(AIRPLANE_RESERVATION_IDX), 0) + 1 FROM AIRPLANE_RESERVATION_TB), " +
            "#{user_idx}, " +
            "#{orderId}, " +
            "#{quantity}, " +
            "#{total_amount}, " +
            "1, " +
            "SYSDATE " +
            ")"
        )
        void insertReservation(@Param("user_idx") int user_idx,
                               @Param("orderId") String orderId,
                               @Param("quantity") int quantity,
                               @Param("total_amount") int totalAmount);
    
    
    @Select(
    	    "SELECT COUNT(*) " +
    	    "FROM AIRPLANE_RESERVATION_TB " +
    	    "WHERE USER_IDX = #{user_idx} AND AIRPLANE_TIME_IDX = #{orderId}"
    	)
    	int checkReservationExists(@Param("user_idx") int user_idx,
    	                           @Param("orderId") String orderId);
    

    @Insert("INSERT INTO payments (order_id, user_id, amount) VALUES (#{orderId}, #{userId}, #{amount})")
    void insertPayment(PaymentVo paymentVo);
    
}
