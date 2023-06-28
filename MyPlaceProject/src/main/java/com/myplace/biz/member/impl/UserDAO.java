package com.myplace.biz.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myplace.biz.member.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserVO getUserDetail(String userId) {
		return mybatis.selectOne("UserDAO.getUserDetail", userId);
	}

	public int checkId(UserVO vo) {
		return mybatis.selectOne("UserDAO.checkId", vo);
	}

	public int checkNickname(UserVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("UserDAO.checkNickname", vo);
	}

	public void registerUser(UserVO vo) {
		mybatis.insert("UserDAO.registerUser", vo);
	}

	public UserVO loginUser(UserVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("UserDAO.loginUser", vo);
	}

}
