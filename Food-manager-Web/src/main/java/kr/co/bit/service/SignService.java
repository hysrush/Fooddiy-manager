package kr.co.bit.service;

import kr.co.bit.vo.ManagerVO;

public interface SignService {

	ManagerVO login(ManagerVO login);
	ManagerVO signUp(ManagerVO managerVO);
	ManagerVO lostId(ManagerVO lost);
	ManagerVO lostPw(ManagerVO lost);
	String sender(ManagerVO member);
	ManagerVO nonSignUp(ManagerVO mail);
	int checkMember(ManagerVO phoneCert);
	
}
