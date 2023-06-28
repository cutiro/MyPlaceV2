package com.myplace.biz.reservation.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myplace.biz.reservation.ReservationDetailVO;
import com.myplace.biz.reservation.ReservationUpdateVO;
import com.myplace.biz.reservation.ReservationVO;

@Repository
public class ReservationDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insertReservation(ReservationVO vo) {
		System.out.println("예약 날짜는?? " + vo.getReservationDday());
		mybatis.insert("ReservationDAO.insertReservation", vo);
	}

	// 파라미터 : session/userInfo.UserVO.userCode
	public List<ReservationDetailVO> getOngoingList(Map<String, Object> option) {
		// TODO Auto-generated method stub
		return mybatis.selectList("ReservationDAO.getReservationList", option);
	}

	// 파라미터 $("#timepicker").value : ReservationVO.reservationDday
	public List<String> getTimeline(ReservationVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("ReservationDAO.getTimeline", vo);
	}

	public int checkReservation(String reservationDday, String reservationDtime) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("reservationDday", reservationDday);
		map.put("reservationDtime", reservationDtime);
		int result = mybatis.selectOne("ReservationDAO.checkReservation", map);
		return result;
	}

	public ReservationUpdateVO getReservationUpdateForm(int reservationCode) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("ReservationDAO.getReservationUpdateForm", reservationCode);
	}

	public void getReservationUpdateForm(ReservationUpdateVO vo) {
		mybatis.selectOne("ReservationDAO.updateReservation", vo);
	}

}
