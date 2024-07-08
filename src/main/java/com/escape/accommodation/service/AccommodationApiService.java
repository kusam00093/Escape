package com.escape.accommodation.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.naming.directory.SearchResult;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.escape.accommodation.domain.Option;
import com.escape.accommodation.domain.Payment;
import com.escape.accommodation.domain.Rate;
import com.escape.accommodation.domain.Review;
import com.escape.accommodation.domain.ReviewImage;
import com.escape.accommodation.domain.ReviewOption;
import com.escape.accommodation.domain.RoomReservation;
import com.escape.accommodation.mapper.AccommodationMapper;

@Service
public class AccommodationApiService {
    
    @Autowired
    private AccommodationMapper accommodationMapper;
    @Autowired
    private SqlSession sqlSession;

    
    public List<SearchResult> search(String query) {
        return accommodationMapper.search(query);
    }

    public boolean usePoints(int personIdx, int pointsToUse) {
        int updatedRows = accommodationMapper.usePoints(personIdx, pointsToUse);
        return updatedRows > 0; // 업데이트된 행이 있으면 true 반환
    }

    public boolean createRoomReservation(RoomReservation roomReservation) {
        return accommodationMapper.insertRoomReservation(roomReservation) > 0;
    }

    public boolean createPayment(Payment payment) {
        return accommodationMapper.insertPayment(payment) > 0;
    }

    @Transactional
    public boolean createRoomReservationAndPayment(RoomReservation roomReservation, Payment payment) {
        // 예약 가능한 객실 확인
        Map<String, Object> params = new HashMap<>();
        params.put("room_idx", roomReservation.getRoom_idx());
        params.put("check_in_date", roomReservation.getCheck_in_date());
        params.put("check_out_date", roomReservation.getCheck_out_date());
    	
        int availableRooms = accommodationMapper.checkAvailableRooms(params);
        if (availableRooms <= 0) {
            throw new RuntimeException("No available rooms");
        }
        
    	int reservationInsertedRows = accommodationMapper.insertRoomReservation(roomReservation);
        if (reservationInsertedRows > 0) {
            // roomReservation 객체의 room_reservation_idx 값이 자동으로 설정됨
            payment.setRoom_reservation_idx(roomReservation.getRoom_reservation_idx());
            int paymentInsertedRows = accommodationMapper.insertPayment(payment);
            if (paymentInsertedRows > 0) {
                // 가용 객실 수 업데이트
                accommodationMapper.updateAvailableRooms(params);
                return true;
            } else {
                throw new RuntimeException("Payment insertion failed");
            }
        } else {
            throw new RuntimeException("Room reservation insertion failed");
        }
    }

    // 결제 상태 확인 로직 추가
    public boolean checkPaymentStatus(String orderId) {
        Payment payment = accommodationMapper.findPaymentByOrderId(orderId);
        return payment != null && payment.getState() == 1; // 결제 완료 상태
    }
    
    private final String uploadDir = "/path/to/upload/dir"; // 실제 파일 시스템 경로로 변경

    public String saveHotelImage(MultipartFile image, int hotelIdx) {
        try {
            String fileName = UUID.randomUUID().toString() + "_" + image.getOriginalFilename();
            Path filePath = Paths.get(uploadDir, fileName);
            Files.copy(image.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
            
            // DB에 이미지 경로 저장
            accommodationMapper.insertHotelImage(hotelIdx, fileName, filePath.toString());

            return "/images/hotel/" + fileName;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public void insertBookmark(Integer userIdx, Integer hotelIdx, Integer state) {
        Map<String, Object> params = new HashMap<>();
        params.put("userIdx", userIdx);
        params.put("hotelIdx", hotelIdx);
        params.put("state", state);
        accommodationMapper.insertBookmark(params);
    }

    public void deleteBookmark(Integer userIdx, Integer hotelIdx) {
        accommodationMapper.deleteBookmark(userIdx, hotelIdx);
    }

    public int getTotalBookmarks(int hotelId) {
        return accommodationMapper.getTotalBookmarks(hotelId);
    }

    public boolean isBookmarkedByUser(int userIdx, int hotelId) {
        return accommodationMapper.isBookmarkedByUser(userIdx, hotelId) > 0;
    }
    
    public Map<String, Object> getAverageRateAndCount(int hotelIdx) {
        return accommodationMapper.getAverageRateAndCount(hotelIdx);
    }

    public List<Map<String, Object>> getReviewsWithDetailsApi(int hotelIdx, String orderBy) {
        return accommodationMapper.getReviewsWithDetailsApi(hotelIdx, orderBy);
    }

    @Transactional
    public boolean addReview(Review review) {
        // 시퀀스 값 가져오기
        int nextReviewId = accommodationMapper.getNextReviewId();
        review.setHotelReviewIdx(nextReviewId);

        // 리뷰 삽입
        accommodationMapper.insertReview(review);

        // 평점 삽입
        int nextRateId = accommodationMapper.getNextRateId();
        Rate rate = new Rate(nextRateId, nextReviewId, review.getPersonIdx(), review.getRate());
        accommodationMapper.insertRate(rate);

        // 이미지 삽입
        if (review.getReviewImages() != null && !review.getReviewImages().isEmpty()) {
            for (ReviewImage image : review.getReviewImages()) {
                int nextImageId = accommodationMapper.getNextReviewImageId();
                image.setHotelReviewImageIdx(nextImageId);
                image.setHotelReviewIdx(nextReviewId);
                accommodationMapper.insertReviewImage(image);
            }
        }

        // 옵션 삽입
        if (review.getOptions() != null && !review.getOptions().isEmpty()) {
            accommodationMapper.insertReviewOptions(nextReviewId, review.getOptions());
        }

        return true;
    }

    public List<Option> getReviewOptions() {
        return accommodationMapper.getReviewOptions();
    }
    
}
