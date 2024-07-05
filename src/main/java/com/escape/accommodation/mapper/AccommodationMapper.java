package com.escape.accommodation.mapper;

import java.util.List;
import java.util.Map;

import javax.naming.directory.SearchResult;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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

}
