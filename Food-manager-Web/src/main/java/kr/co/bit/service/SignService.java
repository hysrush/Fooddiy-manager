package kr.co.bit.service;

import kr.co.bit.vo.UserVO;

public interface SignService {

	UserVO login(UserVO login);
	void signUp(UserVO memberVO);
	UserVO lostId(UserVO lost);
	UserVO lostPw(UserVO lost);
	String sender(UserVO member);
	UserVO nonSignUp(UserVO mail);
	int checkMember(UserVO phoneCert);
	
}
