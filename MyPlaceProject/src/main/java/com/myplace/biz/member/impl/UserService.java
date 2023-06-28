package com.myplace.biz.member.impl;

import com.myplace.biz.member.UserVO;

public interface UserService {

	int checkId(UserVO vo);

	int checkNickname(UserVO vo);

	void registerUser(UserVO vo);

	UserVO loginUser(UserVO vo);

	UserVO getUserDetail(String userId);

}
