package com.escape.login.mapper;

import com.escape.domain.UserVo;
import com.escape.login.domain.Person;
import com.escape.login.domain.Seller;
import com.escape.login.domain.User;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {
  
	void insertUser(User user);
    
	User login(@Param("id") String id,@Param("passwd") String passwd);
    
	int checkIdExists(@Param("id") String id);


	int findUserId(String id);

	User findUserType(int user_idx);

	int getPoint(int user_idx);

	UserVo getUserInfo(int user_idx);

	int findUserType1(int userIdx);

}
