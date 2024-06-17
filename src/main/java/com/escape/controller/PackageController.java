package com.escape.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
//	@RequestMapping("/Home/Sub")
//	public  ModelAndView   sub_home(CategoryVo categoryVo) {		
//		
//		
//		List<PackageVo> packageList_sub = packageMapper.getPackageList_Sub();
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("packageList_sub",packageList_sub);
//		mv.setViewName("package/package_sub_home");
//		
//		return mv;
//	}
//	@GetMapping("/Home/Sub/Category")
//	public  ModelAndView   sub_home_category(@RequestParam("category_idx") int category_idx) {		
//		
//		List<PackageVo> packageList_sub = packageMapper.getPackageList_Sub_Category(category_idx);
//		
//		CategoryVo categoryVo = packageMapper.getCategoryName(category_idx);
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("packageList_sub",packageList_sub);
//		mv.addObject("categoryVo",categoryVo);
//		
//		mv.setViewName("package/package_sub_category");
//		
//		return mv;
//	}
//	
//	@RequestMapping("/Search/Sub")
//	public ModelAndView sub_search_packageList(@RequestParam String keyword) {
//		
//		System.out.println("갤럭시"+keyword);
//		List<PackageVo> packageList_sub = packageMapper.getPackageList_Search(keyword);
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("packageList_sub",packageList_sub);
//		mv.addObject("keyword",keyword);
//		
//		mv.setViewName("package/package_sub_search");
//		
//		return mv;
//	}
	@RequestMapping("/Home/Sub")
	public ModelAndView subHome(
	        @RequestParam(name = "category_idx", required = false) Integer category_idx,
	        @RequestParam(name = "keyword", required = false) String keyword
	) {
	    List<PackageVo> packageListSub;
	    CategoryVo categoryVo = null;
	    if (category_idx != null) {
	        packageListSub = packageMapper.getPackageList_Sub_Category(category_idx);
	        categoryVo = packageMapper.getCategoryName(category_idx);
	    } else if (keyword != null && !keyword.isEmpty()) {
	        System.out.println("갤럭시" + keyword); // 디버깅용 로그
	        packageListSub = packageMapper.getPackageList_Search(keyword);
	        
	    } else {
	        packageListSub = packageMapper.getPackageList();
	    }

	    ModelAndView mv = new ModelAndView();
	    mv.addObject("packageList_sub", packageListSub);
	    
	    if (categoryVo != null) {
	        mv.addObject("categoryVo", categoryVo);
	        System.out.println("카테고리 이름"+categoryVo.getName());
	    } else if (keyword != null && !keyword.isEmpty()) {
	    	
	        mv.addObject("keyword", keyword);
	    } else {
	    }
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
