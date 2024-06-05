package com.injob.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserService {
	
	@Autowired
	private LoginMapper loginMapper;
	
	@Autowired
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    
    public void save( UserVo dto) { //도메인 유저
    	String bCryPasswd = bCryptPasswordEncoder.encode(dto.getUser_passwd());
    	dto.setUser_passwd(bCryPasswd);
    			
    	loginMapper.saveSignup(dto);
    
        //  dto 안에 있는 data 를 저장하고 
        //  저장된 id return
    }
}
