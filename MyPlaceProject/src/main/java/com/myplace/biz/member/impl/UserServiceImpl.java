package com.myplace.biz.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myplace.biz.member.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	
	// 아이디 중복 확인
	@Override
	public int checkId(UserVO vo) {
		return userDAO.checkId(vo);
	}

	// 닉네임 중복 확인
	@Override
	public int checkNickname(UserVO vo) {
		return userDAO.checkNickname(vo);
	}

	@Override
	public void registerUser(UserVO vo) {
		userDAO.registerUser(vo);
	}

	@Override
	public UserVO loginUser(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.loginUser(vo);
	}

	@Override
	public UserVO getUserDetail(String userId) {
		return userDAO.getUserDetail(userId);
	}

}
