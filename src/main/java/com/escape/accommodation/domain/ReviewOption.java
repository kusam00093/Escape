package com.escape.accommodation.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewOption {
    private int hotelReviewOptionIdx;
    private int hotelReviewIdx;
    private int option_idx;
}
