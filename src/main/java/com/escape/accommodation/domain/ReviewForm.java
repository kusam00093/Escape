package com.escape.accommodation.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewForm {
    private int hotelIdx;
    private String content;
    private int rating;
    private List<Integer> options;
    private List<MultipartFile> reviewImages;
}
