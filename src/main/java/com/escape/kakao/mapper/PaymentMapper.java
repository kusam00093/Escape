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
                               @Param("orderId") int orderId1,
                               @Param("quantity") int quantity,
                               @Param("total_amount") int totalAmount);
    
    
    @Select(
    	    "SELECT COUNT(*) " +
    	    "FROM AIRPLANE_RESERVATION_TB " +
    	    "WHERE USER_IDX = #{user_idx} AND AIRPLANE_TIME_IDX = #{orderId}"
    	)
    	int checkReservationExists(@Param("user_idx") int user_idx,
    	                           @Param("orderId") int orderId1);
    
    /*
    @Insert(
    		"INSERT INTO AIRPLANE_PAY_TB ( " +
    		"AIRPLANE_PAY_IDX, " +
    		"USER_IDX, " +
    		"AIRPLANE_RESERVATION_IDX " +
    		"PRICE " +
    		"STATE " +
    		"CREATED " +
    		") VALUES ( " +
    		"(SELECT NVL(MAX(AIRPLANE_PAY_TB), 0) + 1 FROM AIRPLANE_PAY_TB), " +
    		"#{userIdx}, " +
    		"#{applyIdx} " +
    		"#{price} " +
    		"#{state} " +
    		"SYSDATE " +
    		") "
    	)
    	void insertPayment(@Param("applyIdx") int applyIdx,
    					   @Param("userIdx") int userIdx,
    					   @Param("state") int state,
    					   @Param("price") int price);
    */
    
    @Insert(
    		"INSERT INTO AIRPLANE_PAY_TB ( " +
    				"AIRPLANE_PAY_IDX, " +
    				"USER_IDX, " +
    				"AIRPLANE_RESERVATION_IDX, " +
    				"PRICE, " +
    				"STATE, " +
    				"CREATED " +
    				") VALUES ( " +
    				"(SELECT NVL(MAX(AIRPLANE_PAY_IDX), 0) + 1 FROM AIRPLANE_PAY_TB), " +
    				"#{payment.user_idx}, " +
    				"#{Reservationidx}, " +
    				"#{payment.price}, " +
    				"#{payment.state}, " +
    				"SYSDATE " +
    				") "
    		)
    void insertPayment( @Param("payment") PaymentVo paymentVo, @Param("Reservationidx") int Reservationidx );


    @Select(
    		"SELECT AIRPLANE_RESERVATION_IDX " +
    		"FROM AIRPLANE_RESERVATION_TB " +
    		"WHERE AIRPLANE_TIME_IDX = #{airplane_time_idx} "
    		)
	int getReservationIdx(PaymentVo paymentVo);
    
}
