package com.escape.login.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.escape.login.domain.Airline;
import com.escape.login.domain.Apply;
import com.escape.login.domain.Person;
import com.escape.login.domain.Seller;
import com.escape.login.domain.User;

@Mapper
public interface MypageMapper {
	
	Person getPersonByuser_idx(int user_idx);

	Seller getSellerByuser_idx(int user_idx);

	Airline getAirlineByuser_idx(int user_idx);

	void updateUser(User user);

	void updatePerson(Person person);

	void updateSeller(Seller seller);

	void updateAirline(Airline airline);

	Apply getApplyByuser_idx(int user_idx);
	

}
