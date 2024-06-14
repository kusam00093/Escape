package com.escape.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.escape.domain.CategoryVo;
import com.escape.domain.ConvenienceVo;
import com.escape.domain.PackageVo;
import com.escape.domain.Package_ReviewVo;
import com.escape.domain.Package_imageVo;
import com.escape.mapper.PackageMapper;

@Controller
@RequestMapping("/Package")
public class PackageController {

	
	@Autowired
	private PackageMapper packageMapper;
	
	@RequestMapping("/Home")
	public  ModelAndView   home() {
		List<CategoryVo> categoryList = packageMapper.getCategory();
		
		
		List<PackageVo> packageList = packageMapper.getPackageList();
				
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("categoryList",categoryList);
		mv.addObject("packageList",packageList);
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
		PackageVo packageVo = packageMapper.getPackage(1);
		List<Package_ReviewVo> reviewList = packageMapper.getReviews(packageVo.getPackage_idx());
		List<Package_imageVo> package_imageList1 = packageMapper.getPackageImg1(packageVo.getPackage_idx());
		List<Package_imageVo> package_imageList2 = packageMapper.getPackageImg2(packageVo.getPackage_idx());
		List<Package_imageVo> package_imageList3 = packageMapper.getPackageImg3(packageVo.getPackage_idx());
		Package_ReviewVo package_Rate = packageMapper.getAverageRate(packageVo.getPackage_idx());
		Package_ReviewVo package_Rate_Max = packageMapper.getMaxRate(packageVo.getPackage_idx());
		Package_ReviewVo package_ReviewCount = packageMapper.getReviewCount(packageVo.getPackage_idx());
		
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("coList", coList);
		mv.addObject("packageVo", packageVo);
		mv.addObject("reviewList", reviewList);
		mv.addObject("package_ReviewCount", package_ReviewCount);
		mv.addObject("package_Rate", package_Rate);
		mv.addObject("package_Rate_Max", package_Rate_Max);
		mv.addObject("package_imageList1", package_imageList1);
		mv.addObject("package_imageList2", package_imageList2);
		mv.addObject("package_imageList3", package_imageList3);
		mv.setViewName("package/package_detail");
		return mv;
	}
}
