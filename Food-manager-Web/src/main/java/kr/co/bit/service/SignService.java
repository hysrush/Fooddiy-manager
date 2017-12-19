package kr.co.bit.service;

import kr.co.bit.vo.ManagerVO;

public interface SignService {
	
	// id 중복
	int checkMember(String id);
	
	// 관리자 인증 코드
	String managerCheck(String id);
	
	//관리자 지점 확인
	int branchCheck(String storeName);
	
	// 회원 가입
	ManagerVO signUp(ManagerVO managerVO);
	
	// 로그인
	ManagerVO login(ManagerVO login);

	// pw 찾기
	ManagerVO lostPw(ManagerVO lost);
	
	// 비밀번호 변경
	void setPw(ManagerVO up);
	
	// 현재 비밀번호와 새로운 비밀번호가 일치하는지 확인
	int checkpw(ManagerVO check);
	
	// 회원 정보 보기
	ManagerVO selectManager(String id);
	
	// 매니저 정보 수정
	ManagerVO updateManager(ManagerVO up);

}
