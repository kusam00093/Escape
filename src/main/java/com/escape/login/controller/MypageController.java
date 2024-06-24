package com.escape.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.escape.login.domain.Airline;
import com.escape.login.domain.Apply;
import com.escape.login.domain.Person;
import com.escape.login.domain.Seller;
import com.escape.login.domain.User;
import com.escape.login.mapper.MypageMapper;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class MypageController {
    
    @Autowired
    private MypageMapper mypageMapper;
    
    @RequestMapping("/mypage")
    public ModelAndView mypage(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        Boolean isLoggedInObj = (Boolean) session.getAttribute("isLoggedIn");
        Boolean isLoggedIn = isLoggedInObj != null && isLoggedInObj.booleanValue();
                
        if (isLoggedIn != null && isLoggedIn) {
        	
            User user = (User) session.getAttribute("login");
            int usertype = user.getType();
            
            if (user != null) {
                if (usertype == 1) {
                	
                    int user_idx = user.getUser_idx(); 
                    Person person = mypageMapper.getPersonByuser_idx(user_idx);
                   
                    mv.addObject("user", user);
                    mv.addObject("person", person);
            
                    mv.setViewName("member/mypage");

                    return mv;
                    
                } else if (usertype == 2) {
                	
                    int user_idx = user.getUser_idx();
                    Seller seller = mypageMapper.getSellerByuser_idx(user_idx);
        
                    mv.addObject("user", user);
                    mv.addObject("seller", seller);
                    
                    mv.setViewName("member/mypageseller");

                    return mv;
                    
                } else if (usertype == 3) {
                	
                    int user_idx = user.getUser_idx();
                    Airline airline = mypageMapper.getAirlineByuser_idx(user_idx);
                    
                    mv.addObject("user", user);
                    mv.addObject("airline", airline);
                    
                    mv.setViewName("member/mypageairline");

                    return mv;
                }
            }
        } else {
        	System.out.println("컨트롤러아웃");
            mv.setViewName("redirect:/");
            return mv;
        }
        return mv;
    }
    
    
    // 개인회원 수정페이지로 이동
    @RequestMapping("/mypageUpdateForm")
    public ModelAndView mypageUpdateForm(HttpSession session) {
    	ModelAndView mv = new ModelAndView();
    	
    	User user = (User) session.getAttribute("login");
        Person person = mypageMapper.getPersonByuser_idx(user.getUser_idx());
        
        mv.addObject("user", user);
        mv.addObject("person", person);
        mv.setViewName("member/mypageupdateform");
        
        return mv;
    	
    }
    
    // 개인회원 정보 수정 
    @PostMapping("/mypageUpdate")
    @ResponseBody
    public ModelAndView mypageUpdate(User user, Person person, HttpSession session) {

    	ModelAndView mv = new ModelAndView();

	    mypageMapper.updateUser(user);
	    mypageMapper.updatePerson(person);
	    
	    session.setAttribute("login", user);
	    
	    mv.setViewName("redirect:/mypage");
	    return mv;
	    
	}
    
    // seller 회원 수정페이지로 이동
    @RequestMapping("/mypageSellerUpdateForm")
    public ModelAndView mypageSellerUpdateForm(HttpSession session) {
    	ModelAndView mv = new ModelAndView();
    	
    	User user = (User) session.getAttribute("login");
    	Seller seller = mypageMapper.getSellerByuser_idx(user.getUser_idx());
    	
    	mv.addObject("user", user);
    	mv.addObject("seller", seller);
    	mv.setViewName("member/mypagesellerupdateform");
    	
    	return mv;
    	
    }
    
 // seller 회원 정보 수정 
    @PostMapping("/mypageSellerUpdate")
    @ResponseBody
    public ModelAndView mypageSellerUpdate(User user, Seller seller, HttpSession session) {

    	ModelAndView mv = new ModelAndView();

	    mypageMapper.updateUser(user);
	    mypageMapper.updateSeller(seller);
	    
	    session.setAttribute("login", user);
	    
	    mv.setViewName("redirect:/mypage");
	    return mv;
	    
	}
    
    // Airline 회원 수정페이지로 이동
    @RequestMapping("/mypageAirlineUpdateForm")
    public ModelAndView mypageAirlineUpdateForm(HttpSession session) {
    	ModelAndView mv = new ModelAndView();
    	
    	User user = (User) session.getAttribute("login");
    	Airline airline = mypageMapper.getAirlineByuser_idx(user.getUser_idx());
    	
    	mv.addObject("user", user);
    	mv.addObject("airline", airline);
    	mv.setViewName("member/mypageairlineupdateform");
    	
    	return mv;
    	
    }
    
 // Airline 회원 정보 수정
    @PostMapping("/mypageAirlineUpdate")
    @ResponseBody
    public ModelAndView mypageAirlineUpdate(User user, Airline airline, HttpSession session) {
    	ModelAndView mv = new ModelAndView();

	    mypageMapper.updateUser(user);
	    mypageMapper.updateAirline(airline);
	    
	    session.setAttribute("login", user);
	    
	    mv.setViewName("redirect:/mypage");
	    return mv;
	    
	}
    
//    //신청내역
//    @RequestMapping("/mypagebuy")
//    public ModelAndView mypagebuy(HttpSession session) {
//    	ModelAndView mv = new ModelAndView();
//    	
//    	User user = (User) session.getAttribute("login");
//    	Apply apply = mypageMapper.getApplyByuser_idx(user.getUser_idx());
//    	
//    	
//    	
//
//    	
//    	
//    	return mv;
//    }
    
    
    @RequestMapping("/profile")
    public ModelAndView mypagehome(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        Boolean isLoggedInObj = (Boolean) session.getAttribute("isLoggedIn");
        Boolean isLoggedIn = isLoggedInObj != null && isLoggedInObj.booleanValue();
                
        if (isLoggedIn != null && isLoggedIn) {
        	
            User user = (User) session.getAttribute("login");
            int usertype = user.getType();
            
            if (user != null) {
                if (usertype == 1) {
                	
                    int user_idx = user.getUser_idx(); 
                    Person person = mypageMapper.getPersonByuser_idx(user_idx);
                   
                    mv.addObject("user", user);
                    mv.addObject("person", person);
            
                    mv.setViewName("member/profile");

                    return mv;
                    
                } else if (usertype == 2) {
                	
                    int user_idx = user.getUser_idx();
                    Seller seller = mypageMapper.getSellerByuser_idx(user_idx);
        
                    mv.addObject("user", user);
                    mv.addObject("seller", seller);
                    
                    mv.setViewName("member/profileseller");

                    return mv;
                    
                } else if (usertype == 3) {
                	
                    int user_idx = user.getUser_idx();
                    Airline airline = mypageMapper.getAirlineByuser_idx(user_idx);
                    
                    mv.addObject("user", user);
                    mv.addObject("airline", airline);
                    
                    mv.setViewName("member/profileairline");

                    return mv;
                }
            }
        } else {
        	System.out.println("컨트롤러아웃");
            mv.setViewName("redirect:/");
            return mv;
        }
        return mv;
    }
    
    
    
}
