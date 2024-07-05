package com.escape.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.escape.domain.CategoryVo;
import com.escape.domain.ConvenienceVo;
import com.escape.domain.PackageVo;
import com.escape.domain.Package_ReviewVo;
import com.escape.domain.Package_imageVo;

@Mapper
public interface PackageRestMapper {

	List<PackageVo> getPackageList_Sub();

	List<PackageVo> getRecentPackageList_Sub();



	List<PackageVo> getPackageList_Sub_Category();

	List<PackageVo> getPackageList_Sub_Category(int category_idx);

	List<PackageVo> getRecentPackageList_Sub_Categor(int category_idx);

	List<PackageVo> getPackageListSubCategory(int category_idx);

	List<PackageVo> getPackageList_Sub_Search(String keyword);

	List<PackageVo> getRecentPackageList_Sub_Search(String keyword);

	

}
