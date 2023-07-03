package com.myplace.view.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myplace.biz.member.UserVO;
import com.myplace.biz.reservation.ReservationDetailVO;
import com.myplace.biz.reservation.ReservationUpdateVO;
import com.myplace.biz.reservation.ReservationVO;
import com.myplace.biz.reservation.impl.ReservationService;


@Controller
public class ReservationController {
	
	@Autowired
	ReservationService reservationService;
	
	// 이미 예약된 시간인지 확인
	@ResponseBody
	@RequestMapping("/checkReservation.do")
	public int checkReservation(@RequestParam String reservationDday, @RequestParam String reservationDtime) {
		// 현재 시간을 넘긴 예약은 받지 않는다.
		System.out.println("체크 컨트롤러 실행");
		int result = 0;
		try {
			Date today = new Date(); 
			System.out.println("today : " + today);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String rdate = reservationDday + " " + reservationDtime;
			Date rdate_ = format.parse(rdate);
			boolean isPass = today.after(rdate_); // 현재시각이 예약시각보다 이전
			
			if (isPass) { // 현재 시각보다 더 늦은 시간대를 예약하려고 하기 때문에, 예약 실패
				return 3;
			} 
			result = reservationService.checkReservation(reservationDday,reservationDtime);
			System.out.println("예약 확인 결과 : " + result);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 장소 예약 처리
	@RequestMapping("/insertReservation.do")
	public String reservationPlace(ReservationVO vo, HttpSession session) {
		System.out.println("예약 날짜 확인 " + vo.getReservationDday());
		UserVO login = (UserVO) session.getAttribute("userInfo");
		vo.setReservationUserInfo(login.getUserId()); // 예약자 계정 정보, 예약 VO에 담기
		reservationService.insertReservation(vo);
		return "redirect:/userHome.do?userId="+login.getUserId();
	}
	
	// 예약 목록 - GET
	// Parameter : session.userInfo.UserVO.userCode + 
	// Parameter : String orderBy : " All , ongoing , complete " :: 모든 예약, 아직 예약일이 지나지 않은, 지난
	@RequestMapping(value = "/getOngoingList.do")
	public String getReservationList(@RequestParam String userId, @RequestParam String orderBy, Model model) {
		Map<String, Object> option = new HashMap<String, Object>();
		option.put("userId", userId);
		option.put("orderBy", orderBy);
		List<ReservationDetailVO> reservationList = reservationService.getReservationList(option);
		model.addAttribute("reservationList", reservationList);
		return "getReservationList";
	}
	
	@RequestMapping(value = "/getReservationUpdateForm.do")
	public String getReservationUpdateForm(@RequestParam int reservationCode, Model model) {
		ReservationUpdateVO reservationUpdateVO = reservationService.getReservationUpdateForm(reservationCode);
		System.out.println("예약 디테일 " + reservationUpdateVO.getReservationCode());
		model.addAttribute("reservation",reservationUpdateVO);
		return "reservation/reservationUpdateForm";
	}
	
	@RequestMapping(value = "/updateReservation.do")
	public String updateReservation(ReservationUpdateVO vo, HttpSession session) {
		UserVO login = (UserVO) session.getAttribute("userInfo");
		String userId = login.getUserId();
		reservationService.updateReservation(vo);
		return "redirect:/userHome.do?userId="+userId;
	}
	
}
