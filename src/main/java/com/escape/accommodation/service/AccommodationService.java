package com.escape.accommodation.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.accommodation.domain.Hotel;
import com.escape.accommodation.domain.Room;
import com.escape.accommodation.mapper.AccommodationMapper;
import com.escape.login.mapper.MypageMapper;


@Service
public class AccommodationService {
	
	@Autowired
    private AccommodationMapper accommodationMapper;

	@Autowired
    private MypageMapper myPageMapper;
	
    public List<Hotel> searchHotels(Map<String, Object> params) {
        List<Hotel> hotels = accommodationMapper.searchHotels(params);
        System.out.println("Executed SQL, retrieved hotels: " + hotels.size());
        for (Hotel hotel : hotels) {
            System.out.println("hotel foreach:==========="+hotel);
        }
        return hotels;
    }

	public List<Map<String, Object>> getHotelPrice() {
		return accommodationMapper.getHotelPrice();
	}

	public List<String> getHotelImages(int hotel_idx) {
		return accommodationMapper.getHotelImages(hotel_idx);
	}

	public Hotel getHotelById(int hotel_idx) { 
		return accommodationMapper.getHotelById(hotel_idx);
	}
	
    public List<Map<String, Object>> getHotelFacilities(int hotel_idx) {
        return accommodationMapper.getHotelFacilities(hotel_idx);
    }
    
    public List<Room> getRoomsByHotelId(int hotel_idx) {
        return accommodationMapper.getRoomsByHotelId(hotel_idx);
    }

	public Room getRoomById(int room_idx) { 
		return accommodationMapper.getRoomById(room_idx);
	}

	public Integer getPointsByPersonIdx(int person_idx) {
		return accommodationMapper.getPointsByPersonIdx(person_idx);
	}
}