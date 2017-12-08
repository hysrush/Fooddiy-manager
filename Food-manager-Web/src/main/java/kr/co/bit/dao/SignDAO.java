package kr.co.bit.dao;

import kr.co.bit.vo.ManagerVO;

public interface SignDAO {
	
	//회원가입
	ManagerVO signUp(ManagerVO managerVO);
	
	// 지점 확인
	int branchCheck(String branch);
	
	// 로그인
	ManagerVO login(ManagerVO login);
	
	//id 찾기
	ManagerVO lostId(ManagerVO lost);
	
	//pw 찾기
	ManagerVO lostPw(ManagerVO lost);
	
	//임시 비밀번호 설정
	void setPw(ManagerVO setpw);
	
	//가입 확인
	int checkMember(ManagerVO phoneCert);
	
}
