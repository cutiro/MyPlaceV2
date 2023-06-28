package com.myplace.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myplace.biz.member.UserVO;
import com.myplace.biz.member.impl.UserService;
import com.myplace.biz.reservation.impl.ReservationService;

@Controller
public class UserHomeController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ReservationService reservationService;
	
	// 유저 홈, 페이지 출력
	@RequestMapping(value = "/userHome.do", method = RequestMethod.GET)
	public String userHome(@RequestParam String userId, Model model) {
		model.addAttribute(userService.getUserDetail(userId));
		return "userHome";
	}
}
