package com.escape.airplane.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Airplane")
public class AirplaneController {

	@RequestMapping("/Main")
	public ModelAndView main() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("airplane/airplanemain");
		return mv;
		
	}
	
	@RequestMapping("/Search")
	@ResponseBody
	public ModelAndView search( 
			@RequestParam Map<String, String> params
			) {
		
		String depCity = params.get("depCity");
	    String ariCity = params.get("ariCity");
	    String initform = params.get("initform");
	    String seatClass = params.get("seatClass");
	    String depDate = params.get("depDate");
	    String arrdate = params.get("arrdate");
	    
	    System.out.println("=======params: " + params);
		System.out.println("=======depCity: " + depCity);
		System.out.println("=======ariCity: " + ariCity);
		System.out.println("=======initform: " + initform);
		System.out.println("=======seatClass: " + seatClass);
		System.out.println("=======depDate: " + depDate);
		System.out.println("=======arrdate: " + arrdate);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("depCity", depCity);
		mv.addObject("ariCity", ariCity);
		mv.addObject("initform", initform);
		mv.addObject("seatClass", seatClass);
		mv.addObject("depDate", depDate);
		mv.addObject("arrdate", arrdate);
		mv.setViewName("airplane/airplanesearch");
		return mv;
		
	}
	
}
