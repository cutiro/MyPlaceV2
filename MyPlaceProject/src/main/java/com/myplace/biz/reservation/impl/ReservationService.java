package com.myplace.biz.reservation.impl;

import java.util.List;
import java.util.Map;

import com.myplace.biz.reservation.ReservationDetailVO;
import com.myplace.biz.reservation.ReservationUpdateVO;
import com.myplace.biz.reservation.ReservationVO;

public interface ReservationService {
	void insertReservation(ReservationVO vo);

	List<ReservationDetailVO> getReservationList(Map<String, Object> option);

	int checkReservation(String reservationDday, String reservationDtime);

	ReservationUpdateVO getReservationUpdateForm(int reservationCode);

	void updateReservation(ReservationUpdateVO vo);
}
