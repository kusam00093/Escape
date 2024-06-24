package com.injob.login.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;


@Service
public class LoginDetailService implements UserDetailsService {
	
	
	@Autowired
	private LoginMapper loginMapper;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		UserVo user = loginMapper.login(username);
		

		
		if(user != null) {
			LoginService loginDetail = new LoginService();
			loginDetail.setUser(user);
			
			return loginDetail;
			
		}else {
			throw new UsernameNotFoundException("유저없음");
		}
		
	}

}
