package com.escape.accommodation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.escape.accommodation.domain.Hotel;
import com.escape.accommodation.service.AccommodationService;


@Controller
@RequestMapping("/Accommodation")
public class AccommodationController {
	
	@Autowired
	private AccommodationService accommodationService;
	
	@RequestMapping("/Home")
	public ModelAndView home() {
		
		ModelAndView  mv         =  new ModelAndView();
		mv.setViewName("accommodation/accommodationHome");
		
		return mv; 
	}
	
	@RequestMapping("/Products")
	public ModelAndView products(
					@RequestParam(value = "place", required = false) String place,
	            	@RequestParam(value = "date", required = false) String date,
		            @RequestParam(value = "guest", required = false, defaultValue = "1") int guest) {
		ModelAndView  mv         =  new ModelAndView();
		
		Map<String, Object> params = new HashMap<>();
		params.put("place", place);
		params.put("date", date);
		params.put("guest", guest);
		
		
		List<Hotel> hotels = accommodationService.searchHotels(params);
		
		System.out.println("params========" + params);
		System.out.println("place========" + place);
		System.out.println("date========" + date);
		System.out.println("guest========" + guest);
		System.out.println("hotels========" + hotels);
		mv.addObject("hotels", hotels);
		mv.setViewName("accommodation/accommodationProducts");
		
		return mv; 
	}
}
