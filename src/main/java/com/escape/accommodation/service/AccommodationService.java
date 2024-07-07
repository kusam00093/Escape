package com.escape.accommodation.service;


import java.math.BigDecimal;
import java.util.HashMap;
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
	
	public List<Map<String, Object>> getRoomPricesWithDiscounts(int hotel_idx) {
	    return accommodationMapper.getRoomPricesWithDiscounts(hotel_idx);
	}

    public boolean isSeller(Integer userIdx) {
        return accommodationMapper.countSellersByUserIdx(userIdx) > 0;
    }

    public Map<String, Object> getAverageRateAndCount(int hotelIdx) {
        return accommodationMapper.getAverageRateAndCount(hotelIdx);
    }
    
    public Map<Integer, Integer> getRateDistribution(int hotelIdx) {
        List<Map<String, Object>> resultList = accommodationMapper.getRateDistribution(hotelIdx);
        Map<Integer, Integer> rateDistribution = new HashMap<>();

        // 초기화
        for (int i = 1; i <= 5; i++) {
            rateDistribution.put(i, 0);
        }

        // 결과 매핑
        for (Map<String, Object> result : resultList) {
            Integer rate = ((BigDecimal) result.get("RATE")).intValue();
            Number count = (Number) result.get("COUNT");
            if (count != null) {
                rateDistribution.put(rate, count.intValue());
            }
        }

        return rateDistribution;
    }
    
    public List<Map<String, Object>> getReviewOptions(int hotelIdx) {
        return accommodationMapper.getReviewOptions(hotelIdx);
    }

    public List<Map<String, Object>> getTopReviewOptions(int hotelIdx) {
        return accommodationMapper.getTopReviewOptions(hotelIdx);
    }

    public List<Map<String, Object>> getReviewsWithDetails(int hotelIdx) {
        return accommodationMapper.getReviewsWithDetails(hotelIdx);
    }
}