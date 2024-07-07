package com.escape.accommodation.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Bookmark {
    private Integer userIdx;
    private Integer hotelIdx;
    private Integer state;
    private Date created;
}
