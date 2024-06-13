package com.escape.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.escape.domain.CategoryVo;
import com.escape.domain.ConvenienceVo;
import com.escape.domain.PackageVo;
import com.escape.domain.Package_ReviewVo;
import com.escape.domain.Package_imageVo;

@Mapper
public interface PackageMapper {

	List<CategoryVo> getCategory();


	List<ConvenienceVo> getConvenience(int i);




	PackageVo getPackage(int package_idx);




	List<Package_ReviewVo> getReviews(int package_idx);


	List<Package_imageVo> getPackageImgList(int package_idx);


	List<Package_imageVo> getPackageImg1(int package_idx);
	List<Package_imageVo> getPackageImg2(int package_idx);
	List<Package_imageVo> getPackageImg3(int package_idx);


}
