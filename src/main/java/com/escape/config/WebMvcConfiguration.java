//package com.escape.config;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//
//import com.catwork.interceptor.LoginCheckInterceptor;
//
//@Configuration
//public class WebMvcConfiguration implements WebMvcConfigurer {
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(new LoginCheckInterceptor())
//		        .addPathPatterns("/**","/**/*")
//		        .excludePathPatterns("/","/LoginForm","/logout","/Search",
//		        					 "/Person/Login","/Person/JoinForm","/Person/Join",
//		        					 "/Company/Login","/Company/JoinForm","/Company/Join",
//		        		             "/Board/PersonBoard*","/Board/View*",
//		        		             "/Board/CompanyBoard*","/Board/CView*",
//		        		             "/Board/HomeBoard*","/Board/HView*",
//		        		             "/Board/PersonBoard?nowpage=1",
//		        		             "/CheckId",
//		        		             "/Company/Viewpost",
//		        		             "/log*","/css/**", "/img/**", "/js/**"
//		        		             );
//			
//	}	
//	
//
//}


