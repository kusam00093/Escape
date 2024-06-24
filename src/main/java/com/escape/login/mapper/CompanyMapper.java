package com.escape.login.mapper;

import com.escape.login.domain.Airline;
import com.escape.login.domain.Person;
import com.escape.login.domain.Seller;
import com.escape.login.domain.User;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CompanyMapper {

	void insertCompany(Seller seller);

	void insertCompany3(Airline airline);


}
