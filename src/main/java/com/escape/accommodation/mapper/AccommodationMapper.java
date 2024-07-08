package com.escape.accommodation.mapper;

import java.util.List;
import java.util.Map;

import javax.naming.directory.SearchResult;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.escape.accommodation.domain.Hotel;
import com.escape.accommodation.domain.Option;
import com.escape.accommodation.domain.Payment;
import com.escape.accommodation.domain.Rate;
import com.escape.accommodation.domain.Review;
import com.escape.accommodation.domain.ReviewImage;
import com.escape.accommodation.domain.ReviewOption;
import com.escape.accommodation.domain.Room;
import com.escape.accommodation.domain.RoomReservation;

import jakarta.servlet.http.HttpSession;

@Mapper
public interface AccommodationMapper {

	List<SearchResult> search(String query);
	
	List<Hotel> searchHotels(Map<String, Object> params);

	List<Map<String, Object>> getHotelPrice();

	List<String> getHotelImages(int hotel_idx);

	Hotel getHotelById(@Param("hotel_idx") int hotel_idx);

    List<Map<String, Object>> getHotelFacilities(@Param("hotel_idx") int hotel_idx);
    
    List<Room> getRoomsByHotelId(int hotel_idx);

	Room getRoomById(int room_idx);
	
	Integer getPointsByPersonIdx(int person_idx);
	
	int usePoints(@Param("person_idx") int person_idx, @Param("pointsToUse") int pointsToUse);

    int insertRoomReservation(RoomReservation roomReservation);

    int insertPayment(Payment payment);
    
    @Select("SELECT * FROM ROOM_PAY_TB WHERE PARTNER_ORDER_ID = #{orderId}")
	Payment findPaymentByOrderId(String orderId);

    // 가용 객실 수 확인 및 업데이트 메서드 추가
    int checkAvailableRooms(Map<String, Object> params);
    int updateAvailableRooms(Map<String, Object> params);

	List<Map<String, Object>> getRoomPricesWithDiscounts(int hotel_idx);

	int countSellersByUserIdx(@Param("userIdx") Integer userIdx);

	void insertHotelImage(@Param("hotelIdx") int hotelIdx, @Param("image") String image, @Param("imagePath") String imagePath);

    void insertBookmark(Map<String, Object> params);
    
    void deleteBookmark(@Param("userIdx") int userIdx, @Param("hotelIdx") int hotelIdx);
    
    int getTotalBookmarks(@Param("hotelId") int hotelId);
    
    int isBookmarkedByUser(@Param("userIdx") int userIdx, @Param("hotelId") int hotelId);
    
    Map<String, Object> getAverageRateAndCount(int hotelIdx);
    
    List<Map<String, Object>> getRateDistribution(int hotelIdx);

    List<Map<String, Object>> getReviewOptions(int hotelIdx);
    
    List<Map<String, Object>> getTopReviewOptions(@Param("hotelIdx") int hotelIdx);

    List<Map<String, Object>> getReviewsWithDetailsApi(@Param("hotelIdx") int hotelIdx, @Param("orderBy") String orderBy);

    List<Map<String, Object>> hotelsFiltering(
            @Param("orderBy") String orderBy,
            @Param("minPrice") Integer minPrice,
            @Param("maxPrice") Integer maxPrice,
            @Param("minRating") Integer minRating,
            @Param("maxRating") Integer maxRating
      );
    
    int getNextReviewId();
    
    int getNextRateId();
    
    int getNextReviewImageId();
    
    int getNextReviewOptionId();
    
    int insertReview(Review review);

    int insertRate(Rate rate);

    int insertReviewImage(ReviewImage reviewImage);
    
    void insertReviewOption(ReviewOption reviewOption);

    int insertReviewOptions(@Param("hotelReviewIdx") int hotelReviewIdx, @Param("options") List<Integer> options);

    List<Option> getReviewOptions();

    void insertReviewImages(@Param("hotelReviewIdx") int hotelReviewIdx, @Param("reviewImages") List<ReviewImage> reviewImages);

    List<Map<String, Object>> getReviewsWithDetails(@Param("hotel_idx") int hotelIdx);
    
    List<String> getReviewImages(@Param("reviewIdx") int reviewIdx);

}