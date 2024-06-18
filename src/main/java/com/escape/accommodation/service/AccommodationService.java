package com.escape.accommodation.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.accommodation.domain.Hotel;
import com.escape.accommodation.mapper.AccommodationMapper;


@Service
public class AccommodationService {
	
	@Autowired
    private AccommodationMapper accommodationMapper;

    public List<Hotel> searchHotels(Map<String, Object> params) {
        List<Hotel> hotels = accommodationMapper.searchHotels(params);
        System.out.println("Executed SQL, retrieved hotels: " + hotels.size());
        for (Hotel hotel : hotels) {
            System.out.println("hotel foreach:==========="+hotel);
        }
        return hotels;
    }
}