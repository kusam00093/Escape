package com.escape.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.escape.accommodation.domain.Payment;
import com.escape.accommodation.domain.RoomReservation;
import com.escape.accommodation.mapper.AccommodationMapper;
import com.escape.domain.Package_ReservationVo;
import com.escape.login.mapper.UserMapper;
import com.escape.mapper.PackageMapper;


@Service
public class PackageApiService {
	
	@Autowired
	private UserMapper userMapper;
	
    @Autowired
    private AccommodationMapper accommodationMapper;
    
    
    @Autowired
    private PackageMapper packageMapper;


	public Integer getPointsByPersonIdx(int user_idx) {
		return userMapper.getPoint(user_idx);
	}
	
    public boolean usePoints(int personIdx, int pointsToUse) {
        int updatedRows = accommodationMapper.usePoints(personIdx, pointsToUse);
        return updatedRows > 0; // 업데이트된 행이 있으면 true 반환
    }

    public boolean createPackageReservation(Package_ReservationVo reservationVo) {
        return packageMapper.insertPackage_Reservation(reservationVo) > 0;
    }

    public boolean createPackagePayment(Payment payment) {
        return packageMapper.insertPackage_Payment(payment) > 0;
    }

    @Transactional
    public boolean createPackageReservationAndPayment(Package_ReservationVo reservationVo, Payment payment) {
        int reservationInsertedRows = packageMapper.insertPackage_Reservation(reservationVo);
        if (reservationInsertedRows > 0) {
            int paymentInsertedRows =  packageMapper.insertPackage_Payment(payment);
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