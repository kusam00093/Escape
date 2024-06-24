package com.escape.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.escape.login.domain.Airline;
import com.escape.login.domain.Person;
import com.escape.login.domain.Seller;
import com.escape.login.domain.User;
import com.escape.login.mapper.CompanyMapper;
import com.escape.login.mapper.PersonMapper;
import com.escape.login.mapper.UserMapper;
import com.escape.login.service.SellerService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Controller
public class UserController {

	@Autowired
    private UserMapper userMapper;
	
	@Autowired
    private PersonMapper personMapper;
	
	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
    private SellerService sellerService;
	

   @GetMapping("/personlogin")
   public String personlogin() {
	   return "member/personlogin";
   }
   @GetMapping("/companylogin")
	public  String  companylogin() {
		return "member/companylogin"; 
	}
	// 회원가입 유형선택 페이지
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
   // 개인 회원가입 페이지
	@GetMapping("/personjoin")
	public  String  personjoin() {
		return "member/personjoin"; 
}
	
	@GetMapping("/sellerClassification")
	public  String  sellerClassification() {
		return "member/sellerClassification"; 
	}
	
	// 여행사 회원가입 페이지
	@GetMapping("/companyjoin1")
	public  String  companyjoin1() {
		return "member/companyjoin1"; 
	}
	
	// 숙박업 회원가입 페이지
	@GetMapping("/companyjoin2")
	public  String  companyjoin2() {
		return "member/companyjoin2";
	}
	
	// 항공사 회원가입 페이지
	@GetMapping("/companyjoin3")
	public  String  companyjoin3() {
		return "member/companyjoin3"; 
	}

    
    //개인 회원가입
    @PostMapping("/personjoin")
    @Transactional
    public ModelAndView write(Person person, User user) {
    	
    	userMapper.insertUser(user);
    	personMapper.insertPerson(person);

    	ModelAndView mv = new ModelAndView();
    	
    	mv.setViewName("redirect:/personlogin");
    	return mv;
    }
    
    // 로그인 (개인+기업)
    @RequestMapping(value="/personlogin", method = {RequestMethod.POST})
    public ModelAndView login(HttpServletRequest request, User user, 
    		HttpServletResponse response) throws IOException { 
    	ModelAndView mv = new ModelAndView();
    	
    	String id = request.getParameter("id");
    	String passwd = request.getParameter("passwd");
    	
    	user = userMapper.login(id, passwd);
    	
    	if (user != null) { 
    		HttpSession session = request.getSession();
    		session.setMaxInactiveInterval(60*60);
    		session.setAttribute("login", user);
    		session.setAttribute("isLoggedIn", true);
    		mv.setViewName("redirect:/");
    	
    	} else { // 로그인 실패시
    	    response.setCharacterEncoding("UTF-8");
    	    response.setContentType("text/html; charset=UTF-8");
    	    PrintWriter out = response.getWriter();
    	    out.println("<script>alert('로그인 실패: 아이디 또는 비밀번호를 확인하세요');</script>");
    	    out.println("<script>history.go(-1);</script>");
    	    out.close();
    	    mv.setViewName("redirect:/personlogin");
    	}
		return mv;
    }
    
 // 개인 로그아웃을 한다
 		@RequestMapping("/logout")
 		public   String   logout(  HttpSession  session    ) {
 			session.invalidate();
 			return  "redirect:/personlogin";
 		}
 		
 		// 유저 아이디 중복체크
 		@PostMapping("/checkIdExists")
 	    @ResponseBody
 	    public boolean checkIdExists(@RequestParam("id") String id) {
 	        int count = userMapper.checkIdExists(id);
 	        return count > 0;
 	    }
 		
 		// 유저 비밀번호 일치불일치 확인(Mapper 불필요함)
 		@PostMapping("/checkPasswordMatch")
 		@ResponseBody
 		public boolean checkPasswordMatch(@RequestParam("password") String password, @RequestParam("confirmPassword") String confirmPassword) {
 		    return password.equals(confirmPassword);
 		}
 		
 		// 여행사 숙박업 회원가입
 		@PostMapping("/companyjoin")
 	    @Transactional
 	    public ModelAndView write(MultipartFile file, Seller seller, User user) {
 			
 		// 프로그램내에서는 상대경로(filePath)를 사용함
 		    // =====relativePath: images\20240512_074711.png
 		    // =====filePath: images/20240512_074711.png
 			
 	        try {
 	            // 파일 업로드 처리
 	            String filePath = sellerService.storeFile(file);
 	            seller.setLogo(filePath);
 	            
 	            System.out.println("============filePath:"+ filePath);

 	            // 데이터베이스 저장
 	            userMapper.insertUser(user);
 	            companyMapper.insertCompany(seller);

 	            // 리다이렉트 설정
 	            ModelAndView mv = new ModelAndView();
 	            mv.setViewName("redirect:/personlogin");
 	            return mv;
 	            
 	        } catch (Exception e) {
 	            e.printStackTrace();
 	            
 	            return new ModelAndView("error");
 	        }
 	    }
 		
 		
 	// 항공사 회원가입
 	 		@PostMapping("/companyjoin3")
 	 	    @Transactional
 	 	    public ModelAndView write(@RequestParam("file") MultipartFile file,
 	 	    		Airline airline, User user) {
 	 	        try {
 	 	            // 파일 업로드 처리
 	 	            String filePath = sellerService.storeFile(file);
 	 	            airline.setLogo(filePath);

 	 	            // 데이터베이스 저장
 	 	            userMapper.insertUser(user);
 	 	            companyMapper.insertCompany3(airline);

 	 	            // 리다이렉트 설정
 	 	            ModelAndView mv = new ModelAndView();
 	 	            mv.setViewName("redirect:/personlogin");
 	 	            return mv;
 	 	            
 	 	        } catch (Exception e) {
 	 	            e.printStackTrace();
 	 	            
 	 	            return new ModelAndView("error");
 	 	        }
 	 	    }

}