package com.myplace.biz.reservation.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myplace.biz.member.UserVO;
import com.myplace.biz.reservation.ReservationDetailVO;
import com.myplace.biz.reservation.ReservationUpdateVO;
import com.myplace.biz.reservation.ReservationVO;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	ReservationDAO reservationDAO;

	// 장소 예약 처리
	@Override
	public void insertReservation(ReservationVO vo) {
		reservationDAO.insertReservation(vo);
	}

	@Override
	public List<ReservationDetailVO> getReservationList(Map<String, Object> option) {
		// TODO Auto-generated method stub
		return reservationDAO.getOngoingList(option);
	}

	@Override
	public int checkReservation(String reservationDday, String reservationDtime) {
		// TODO Auto-generated method stub
		return reservationDAO.checkReservation(reservationDday,reservationDtime);
	}

	@Override
	public ReservationUpdateVO getReservationUpdateForm(int reservationCode) {
		// TODO Auto-generated method stub
		return reservationDAO.getReservationUpdateForm(reservationCode);
	}

	@Override
	public void updateReservation(ReservationUpdateVO vo) {
		reservationDAO.getReservationUpdateForm(vo);
		
	}

}
