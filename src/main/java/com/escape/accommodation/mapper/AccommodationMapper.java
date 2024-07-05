package com.escape.accommodation.mapper;

import java.util.List;
import java.util.Map;

import javax.naming.directory.SearchResult;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.escape.accommodation.domain.Hotel;
import com.escape.accommodation.domain.Payment;
import com.escape.accommodation.domain.Room;
import com.escape.accommodation.domain.RoomReservation;

@Mapper
public interface AccommodationMapper {

	List<SearchResult> search(String query);
	
	List<Hotel> searchHotels(Map<String, Object> params);

	List<Map<String, Object>> getHotelPrice();

	List<String> getHotelImages(int hotel_idx);

	Hotel getHotelById(@Param("hotel_idx") int hotel_idx);

    List<Map<String, Object>> getHotelFacilities(@Param("hotel_idx") int hotel_idx);
    
    List<Room> getRoomsByHotelId(int hotel_idx);

	Room getRoomById(int room_idx);
	
	Integer getPointsByPersonIdx(int person_idx);
	
	int usePoints(@Param("person_idx") int person_idx, @Param("pointsToUse") int pointsToUse);

    int insertRoomReservation(RoomReservation roomReservation);

    int insertPayment(Payment payment);
    
    @Select("SELECT * FROM ROOM_PAY_TB WHERE PARTNER_ORDER_ID = #{orderId}")
	Payment findPaymentByOrderId(String orderId);

    // 가용 객실 수 확인 및 업데이트 메서드 추가
    int checkAvailableRooms(Map<String, Object> params);
    int updateAvailableRooms(Map<String, Object> params);
}
