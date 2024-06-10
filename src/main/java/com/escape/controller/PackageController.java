package com.escape.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.escape.domain.CategoryVo;
import com.escape.domain.ConvenienceVo;
import com.escape.mapper.PackageMapper;

@Controller
@RequestMapping("/Package")
public class PackageController {

	
	@Autowired
	private PackageMapper packageMapper;
	
	@RequestMapping("/Home")
	public  ModelAndView   home() {
		List<CategoryVo> categoryList = packageMapper.getCategory();
		
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("categoryList",categoryList);
		mv.setViewName("package/package_home");
		return mv;
	}
	@RequestMapping("/Home/Sub")
	public  ModelAndView   sub_home() {		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("package/package_sub_home");
		
		return mv;
	}
	@RequestMapping("/Detail")
	public  ModelAndView   detail() {		
		
		List<ConvenienceVo> coList = packageMapper.getConvenience(1);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("package/package_detail");
		mv.addObject("coList", coList);
		return mv;
	}
}
