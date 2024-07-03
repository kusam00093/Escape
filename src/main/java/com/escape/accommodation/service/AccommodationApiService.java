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

    @Transactional // 트랜잭션을 시작합니다.
    public boolean createRoomReservationAndPayment(RoomReservation roomReservation, Payment payment) {
        // Room reservation 데이터 삽입
        boolean reservationSuccess = createRoomReservation(roomReservation);
        
        if (!reservationSuccess) {
            return false;
        }
        
        // 삽입된 roomReservation의 IDX를 가져옵니다.
        int roomReservationIdx = roomReservation.getRoom_reservation_idx();
        
        // Payment 데이터 설정
        payment.setRoom_reservation_idx(roomReservationIdx);

        // Payment 데이터 삽입
        boolean paymentSuccess = createPayment(payment);

        // 성공 여부 반환
        return paymentSuccess;
    }
}
