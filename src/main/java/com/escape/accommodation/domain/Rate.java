package com.escape.accommodation.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Rate {
    private int hotelRateIdx;
    private int hotelReviewIdx;
    private int userIdx;
    private int rate;
}
