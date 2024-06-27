package com.escape.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.escape.domain.CategoryVo;
import com.escape.domain.ConvenienceVo;
import com.escape.domain.PackageVo;
import com.escape.domain.Package_RateVo;
import com.escape.domain.Package_ReservationVo;
import com.escape.domain.Package_ReviewVo;
import com.escape.domain.Package_imageVo;
import com.escape.login.domain.User;
import com.escape.login.mapper.UserMapper;
import com.escape.mapper.PackageMapper;

@Controller
@RequestMapping("/Package")
public class PackageController {

	
	@Autowired
	private PackageMapper packageMapper;
	
	@Autowired
	private UserMapper userMapper;
	
//	@RequestMapping("/Home")
//	public  ModelAndView   home(@SessionAttribute(name = "login", required = false) User user) {
//		
//		
//		User usertype = userMapper.findUserType(user.getUser_idx());
//		
//		List<CategoryVo> categoryList = packageMapper.getCategory();
//		
//		
//		List<PackageVo> packageList = packageMapper.getPackageList();
//				
//		
//		ModelAndView mv = new ModelAndView(); 
//		
//		mv.addObject("categoryList",categoryList);
//		mv.addObject("packageList",packageList);
//		mv.addObject("usertype",usertype);
//		mv.setViewName("package/package_home");
//		return mv; 
//	}
	@RequestMapping("/Home")
	public ModelAndView home(@SessionAttribute(name = "login", required = false) User user) {
	    ModelAndView mv = new ModelAndView();

	    List<CategoryVo> categoryList = packageMapper.getCategory();
	    List<PackageVo> packageList = packageMapper.getPackageList();

	    mv.addObject("categoryList", categoryList);
	    mv.addObject("packageList", packageList);

	    int userIdx = user != null ? user.getUser_idx() : 0; // user가 null이면 userIdx를 0으로 설정

	    if (userIdx > 0) {
	        // userIdx가 0보다 크면(user.getUser_idx()가 존재할 때)
	        User usertype = userMapper.findUserType(userIdx);
	        mv.addObject("usertype", usertype);
	    }

	    mv.setViewName("package/package_home");
	    return mv;
	}
//	@RequestMapping("/Home/Sub")
//	public ModelAndView subHome(
//	        @RequestParam(name = "category_idx", required = false) Integer category_idx,
//	        @RequestParam(name = "keyword", required = false) String keyword,
//	        @SessionAttribute(name = "login", required = false) User user
//	) {
//		
//		User usertype = userMapper.findUserType(user.getUser_idx());
//		
//		
//		
//	    List<PackageVo> packageListSub;
//	    CategoryVo categoryVo = null;
//	    if (category_idx != null) {
//	        packageListSub = packageMapper.getPackageList_Sub_Category(category_idx);
//	        categoryVo = packageMapper.getCategoryName(category_idx);
//	    } else if (keyword != null && !keyword.isEmpty()) {
//	        System.out.println("갤럭시" + keyword); // 디버깅용 로그
//	        packageListSub = packageMapper.getPackageList_Search(keyword);
//	        
//	    } else {
//	        packageListSub = packageMapper.getPackageList();
//	    }
//
//	    ModelAndView mv = new ModelAndView();
//	    mv.addObject("packageList_sub", packageListSub);
//	    
//	    if (categoryVo != null) {
//	        mv.addObject("categoryVo", categoryVo);
//	        System.out.println("카테고리 이름"+categoryVo.getName());
//	    } else if (keyword != null && !keyword.isEmpty()) {
//	    	
//	        mv.addObject("keyword", keyword);
//	    } else {
//	    }
//	    mv.addObject("usertype",usertype);
//	    mv.setViewName("package/package_sub_home");
//	    return mv;
//	}

	
	
	
	@RequestMapping("/Home/Sub")
	public ModelAndView subHome(
	        @RequestParam(name = "category_idx", required = false) Integer category_idx,
	        @RequestParam(name = "keyword", required = false) String keyword,
	        @SessionAttribute(name = "login", required = false) User user
	) {
	    ModelAndView mv = new ModelAndView();

	    List<PackageVo> packageListSub;
	    CategoryVo categoryVo = null;
	    if (category_idx != null) {
	        packageListSub = packageMapper.getPackageList_Sub_Category(category_idx);
	        categoryVo = packageMapper.getCategoryName(category_idx);
	    } else if (keyword != null && !keyword.isEmpty()) {
	        packageListSub = packageMapper.getPackageList_Search(keyword);
	    } else {
	        packageListSub = packageMapper.getPackageList();
	    }

	    mv.addObject("packageList_sub", packageListSub);

	    int userIdx = user != null ? user.getUser_idx() : 0; // user가 null이면 userIdx를 0으로 설정

	    if (userIdx > 0) {
	        // userIdx가 0보다 크면(user.getUser_idx()가 존재할 때)
	        User usertype = userMapper.findUserType(userIdx);
	        mv.addObject("usertype", usertype);
	    }

	    if (categoryVo != null) {
	        mv.addObject("categoryVo", categoryVo);
	        System.out.println("카테고리 이름"+categoryVo.getName());
	    } else if (keyword != null && !keyword.isEmpty()) {
	        mv.addObject("keyword", keyword);
	    }

	    mv.setViewName("package/package_sub_home");
	    return mv;
	}
	
	@RequestMapping("/Detail")
	public  ModelAndView   detail(
			@RequestParam("package_idx") int package_idx,
			@SessionAttribute(name = "login", required = false) User user) {		
		
		List<ConvenienceVo> coList = packageMapper.getConvenience(package_idx);
		PackageVo packageVo = packageMapper.getPackage(package_idx);
		List<Package_ReviewVo> reviewList = packageMapper.getReviews(packageVo.getPackage_idx());
		List<Package_imageVo> package_imageList1 = packageMapper.getPackageImg1(packageVo.getPackage_idx());
		List<Package_imageVo> package_imageList2 = packageMapper.getPackageImg2(packageVo.getPackage_idx());
		List<Package_imageVo> package_imageList3 = packageMapper.getPackageImg3(packageVo.getPackage_idx());
		Package_ReviewVo package_Rate = packageMapper.getAverageRate(packageVo.getPackage_idx());
		Package_ReviewVo package_Rate_Max = packageMapper.getMaxRate(packageVo.getPackage_idx());
		Package_ReviewVo package_ReviewCount = packageMapper.getReviewCount(packageVo.getPackage_idx());
		
		//int paycount = packageMapper.countPay(user.getUser_idx());
		
		ModelAndView mv = new ModelAndView();
		
		
	    int userIdx = user != null ? user.getUser_idx() : 0; // user가 null이면 userIdx를 0으로 설정

	    if (userIdx > 0) {
	        // userIdx가 0보다 크면(user.getUser_idx()가 존재할 때)
	        User usertype = userMapper.findUserType(userIdx);
			int paycount = packageMapper.countPay(user.getUser_idx());
	        mv.addObject("usertype", usertype);
	        mv.addObject("user_idx",userIdx);
	        mv.addObject("paycount",paycount);
	        System.out.println("유저아이디엑스!!!!!!!!!!!!!!!!!!!!"+userIdx);
	    }else {
	    	
	    	
	    }
	    
		
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
	
	
	
	
	@RequestMapping("/Reservation")
	public ModelAndView reservation(
			@RequestParam("reservation_price") int reservation_price,
			@RequestParam("package_idx") int package_idx,
			@RequestParam("reservation_su") int reservation_su,
			@SessionAttribute(name = "login", required = false) User user) {
		
		PackageVo packageVo = packageMapper.getPackage(package_idx);
		
		User usertype = userMapper.findUserType(user.getUser_idx());
		
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("reservation_price", reservation_price);
		mv.addObject("package_idx", package_idx);
		mv.addObject("reservation_su", reservation_su);
		mv.addObject("packageVo", packageVo);
		mv.addObject("usertype", usertype);
		mv.addObject("user_idx", user.getUser_idx());
		mv.setViewName("package/package_reservation");
		return mv;
	}
	
	@RequestMapping("/Reservation/Insert")
	public ModelAndView reservationInsert(
			@RequestParam("reservation_price") int reservation_price,
			@RequestParam("package_idx") int package_idx,
			@RequestParam("reservation_su") int reservation_su,
			Package_ReservationVo prVo,
			PackageVo packageVo) {
		
		
		packageMapper.insertPackageReservation(prVo);
		
		
		System.out.println("insert 됬음");
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("reservation_price", reservation_price);
		mv.addObject("package_idx", package_idx);
		mv.addObject("reservation_su", reservation_su);
		mv.setViewName("rediret:/mypage");
		return mv;
	}
	
	@RequestMapping("/Insert/Review")
	public ModelAndView insertReview(
			Package_ReviewVo reviewVo,
			Package_RateVo rateVo,
			@SessionAttribute(name = "login", required = false) User user) {
		
		int person_idx = packageMapper.findByPersonIdx(user.getUser_idx());
		reviewVo.setPerson_idx(person_idx);
		packageMapper.insertReview(reviewVo);
		
		ModelAndView mv = new ModelAndView();
		return mv;
	}
}
