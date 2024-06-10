package com.escape.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.escape.domain.CategoryVo;
import com.escape.domain.ConvenienceVo;

@Mapper
public interface PackageMapper {

	List<CategoryVo> getCategory();


	List<ConvenienceVo> getConvenience(int i);


}
