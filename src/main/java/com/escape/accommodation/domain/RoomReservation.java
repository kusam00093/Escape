package com.escape.accommodation.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoomReservation {
    private int room_reservation_idx;
    private int user_idx;
    private int room_idx;
    private int reservation_guest;
    private int reservation_price;
    private String check_in_date; // 변경
    private String check_out_date; // 변경
    private int state;
    private LocalDateTime created;
}