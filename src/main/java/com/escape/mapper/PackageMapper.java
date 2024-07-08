package com.escape.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.escape.accommodation.domain.Payment;
import com.escape.domain.CategoryVo;
import com.escape.domain.ConvenienceVo;
import com.escape.domain.DiscountVo;
import com.escape.domain.LocationVo;
import com.escape.domain.PackageVo;
import com.escape.domain.PackageVo2;
import com.escape.domain.Package_RateVo;
import com.escape.domain.Package_ReservationVo;
import com.escape.domain.Package_ReviewVo;
import com.escape.domain.Package_Review_ImgVo;
import com.escape.domain.Package_imageVo;
import com.escape.domain.Package_imageVo2;

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
	Package_ReviewVo getAverageRate(int package_idx);
	Package_ReviewVo getMaxRate(int package_idx);
	Package_ReviewVo getReviewCount(int package_idx);
	List<PackageVo> getPackageList();
	List<PackageVo> getPackageList_Sub();
	List<PackageVo> getPackageList_Sub_Category(int category_idx);
	CategoryVo getCategoryName(int category_idx);
	List<PackageVo> getPackageList_Search(String keyword);
	void insertPackageReservation(Package_ReservationVo prVo);
	int countPay(int user_idx);
	int findByPersonIdx(int user_idx);
	void insertReview(Package_ReviewVo reviewVo);
	void insertReviewRaterate(int user_idx, int rate);
	void insertReviewimage(List<Package_Review_ImgVo> reviewImgList);
	List<LocationVo> getLocation();
	List<ConvenienceVo> getConvenienceList();
	void insertPackage(PackageVo2 packageVo);
	void insertPackageImg(List<Package_imageVo> imgList);
	void insertPackageCategory(int[] categoryIdxArray);
	void insertPackageLocation(int[] locationIdxArrayList);
	void insertPackageConvenience(int[] convenienceIdxArrayList);
	void insertPackageDiscount(int user_idx, int discount_percent, int discount_integer);
	List<Package_imageVo2> getPackageDetailImgList(int package_idx);
	int getPrice(int package_idx);
	int getDate(int package_idx);
	String getImage(int package_idx);
	int getReservation_su(int package_idx);
	int insertPackage_Reservation(Package_ReservationVo reservationVo);
	int insertPackage_Payment(Payment payment);
	void package_incHit(int package_idx);
	List<PackageVo> getPackageList(int user_idx);
	Integer getDiscountPrice(int package_idx);
	int getRemainPerson(int package_idx);
	//int getPackageListCount();
	List<PackageVo> getPackageListPaging(int userIdx, int offset, int recordSize);
	int getPackageListCount(int user_idx);
	//int getPackageListCount(int userIdx, Integer category_idx, String keyword);
	//List<PackageVo> getPackageListPaging(int userIdx, Integer category_idx, String keyword, int offset, int limit);
	String getPeriodDate(int package_idx);
	List<CategoryVo> getCategorybyCategory(int package_idx);
	List<LocationVo> getLocationbyLocation(int package_idx);
	List<ConvenienceVo> getConvenienceByConvenience(int package_idx);
	void deletePakcageCategory(int package_idx);
	void deletePakcageConvenience(int package_idx);
	void deletePakcageLocation(int package_idx);
	void deletePackageImg(int package_idx);
	void updatePackage(PackageVo2 packageVo);
	void deletePakcageDiscount(int package_idx);
	PackageVo getDateToString(int package_idx);
	Package_ReviewVo getMaxReview(int package_idx);
	String getPackageDateTime(int package_idx);
	int getPersonIdx(int user_idx);
	void deletePackageReview(int package_review_idx);

}
