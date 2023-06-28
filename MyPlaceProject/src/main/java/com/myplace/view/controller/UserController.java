package com.myplace.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myplace.biz.member.UserVO;
import com.myplace.biz.member.impl.UserService;

@Controller
public class UserController {
	int result; // id or Nickname 중복 확인 결과 -- 1:중복 0:중복X
	
	@Autowired
	UserService userService;
	
	//로그인 페이지 출력
	@RequestMapping("/loginUserForm.do")
	public String loginUserForm() {
		return "loginUserForm";
	}
	
	//회원가입 페이지 출력
	@RequestMapping("/registerUserForm.do")
	public String registerUserForm() {
		return "registerUserForm";
	}
	
	//로그인 시도
	@ResponseBody
	@RequestMapping(value = "/loginUser.do", method = RequestMethod.POST)
	public int loginUser(UserVO vo, HttpSession session) {
		System.out.println("로그인 컨트롤러 실행");
		int loginResult; // 로그인 결과, 프론트에 출력
		UserVO login = userService.loginUser(vo);
		if (login != null) {
			// 로그인 성공
			session.setMaxInactiveInterval(20*60); //초 단위
			session.setAttribute("userInfo", login);
			return loginResult = 0;
		} else {
			// 로그인 실패
			return loginResult = 1;
		}
	}
	
	//로그아웃 시도
	@RequestMapping("/logoutUser.do")
	public String logoutUser(HttpSession session) {
		System.out.println("로그아웃 컨트롤러 실행");
		session.invalidate();
		return "redirect:/getPlaceList.do";
	}
	
	//회원가입 완료 시도
	@RequestMapping("/registerUser.do")
	public String registerUser(UserVO vo) {
		System.out.println("회원가입 시도");
		userService.registerUser(vo);
		return "redirect:/getPlaceList.do";
	}
	
	//아이디 중복 확인
	@ResponseBody
	@RequestMapping(value = "/checkId.do", method = RequestMethod.POST)
	public int checkId(UserVO vo) {
		System.out.println("아이디 중복 확인");
		return result = userService.checkId(vo);
	}
	
	//닉네임 중복 확인
	@ResponseBody
	@RequestMapping(value = "/checkNickname.do", method = RequestMethod.POST)
	public int checkNickname(UserVO vo) {
		System.out.println("닉네임 중복 확인");
		return result = userService.checkNickname(vo);
	}
	
}
