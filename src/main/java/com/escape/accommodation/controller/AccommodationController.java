package com.escape.accommodation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Accommodation")
public class AccommodationController {
	
	@RequestMapping("/Home")
	public ModelAndView home() {
		
		ModelAndView  mv         =  new ModelAndView();
		mv.setViewName("accommodation/accommodationHome");
		
		return mv; 
	}
	
	@RequestMapping("/Products")
	public ModelAndView products() {
		ModelAndView  mv         =  new ModelAndView();
		mv.setViewName("accommodation/accommodationProducts");
		
		return mv; 
	}
}