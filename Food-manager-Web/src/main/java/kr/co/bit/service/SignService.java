package kr.co.bit.service;

import kr.co.bit.vo.ManagerVO;

public interface SignService {
	
	int checkMember(ManagerVO phoneCert);
	String managerCheck(String id);
	ManagerVO signUp(ManagerVO managerVO);
	ManagerVO login(ManagerVO login);
	ManagerVO lostPw(ManagerVO lost);

}
