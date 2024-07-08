package com.escape.accommodation.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewImage {
    private int hotelReviewImageIdx;
    private int hotelReviewIdx;
    private String image;
}
