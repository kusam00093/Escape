package com.escape.accommodation.service;

import java.util.List;

import javax.naming.directory.SearchResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.escape.accommodation.domain.Payment;
import com.escape.accommodation.domain.RoomReservation;
import com.escape.accommodation.mapper.AccommodationMapper;

@Service
public class AccommodationApiService {
    
    @Autowired
    private AccommodationMapper accommodationMapper;
    
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
        int reservationInsertedRows = accommodationMapper.insertRoomReservation(roomReservation);
        if (reservationInsertedRows > 0) {
            // roomReservation 객체의 room_reservation_idx 값이 자동으로 설정됨
            payment.setRoom_reservation_idx(roomReservation.getRoom_reservation_idx());
            int paymentInsertedRows = accommodationMapper.insertPayment(payment);
            if (paymentInsertedRows > 0) {
                return true;
            } else {
                throw new RuntimeException("Payment insertion failed");
            }
        } else {
            throw new RuntimeException("Room reservation insertion failed");
        }
    }
}
