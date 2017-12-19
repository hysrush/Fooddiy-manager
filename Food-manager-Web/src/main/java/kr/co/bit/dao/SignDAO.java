package kr.co.bit.dao;

import kr.co.bit.vo.ManagerVO;

public interface SignDAO {
	
	// 아이디 중복
	int checkMember(String id);
	
	// 지점 확인
	int branchCheck(String branch);
	
	//회원가입
	ManagerVO signUp(ManagerVO managerVO);
	
	// 로그인
	ManagerVO login(ManagerVO login);
	
	//pw 찾기
	ManagerVO lostPw(ManagerVO lost);
	
	// 비밀번호 설정
	void setPw(ManagerVO setpw);

	// 현재 비밀번호와 새로운 비밀번호가 일치하는지 확인
	int checkpw(ManagerVO check);
	
	// 매니저 정보 보기
	ManagerVO selectManager(String id);
	
	// 매니저 정보 수정
	ManagerVO updateManager(ManagerVO up);
	
}
