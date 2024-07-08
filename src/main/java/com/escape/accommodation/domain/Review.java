package com.escape.accommodation.domain;

import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
    private int hotelReviewIdx;
    private int hotelIdx;
    private String content;
    private int personIdx;
    private LocalDateTime created;
    
    private int rate;
    private List<ReviewImage> reviewImages;
    private List<Integer> options;
    
    // 리뷰 이미지 추가 메소드
    public void addReviewImage(ReviewImage reviewImage) {
        this.reviewImages.add(reviewImage);
    }
}
