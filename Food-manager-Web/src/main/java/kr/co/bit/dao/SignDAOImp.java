package kr.co.bit.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.vo.ManagerVO;

@Repository
public class SignDAOImp implements SignDAO {

	@Autowired
	private SqlSessionTemplate sql;
	String url = "kr.co.bit.manager.dao.";

	//가입했는지 확인
	public int checkMember(String id) {
		
		System.out.println(id);
		
		return sql.selectOne(url+"checkId", id);
	}
	
	// 지점 확인
	@Override
	public int branchCheck(String branch) {
		
		return sql.selectOne(url+"branchCheck", branch);
	}
	
	
	// 회원가입
	public ManagerVO signUp(ManagerVO managerVO) {
		
		sql.insert("kr.co.bit.manager.dao.signUp", managerVO);
		
		return sql.selectOne(url+"login", managerVO);
		
	}
	
	// 로그인
	public ManagerVO login(ManagerVO login) {
		
		// 가입했는지 확인
		int check = sql.selectOne(url+"loginCheck", login);

		System.out.println(check);
		if(check == 0 ) {
			return null;
		}
			
		return sql.selectOne(url+"login", login);
		
		
	}
	
	// pw 찾기
	public ManagerVO lostPw(ManagerVO lost) {
		System.out.println(lost.toString());
		int check = sql.selectOne(url+"lostPwCheck", lost);
		System.out.println(check);
		if(check == 0) {
			return null;
		}
		return sql.selectOne(url+"lostPw", lost);
	}

	// 비밀번호 설정
	public void setPw(ManagerVO setpw) {
	
		System.out.println(setpw.toString());
		sql.update(url+"pwUpdate", setpw);
	}

	// 현재 비밀번호와 새로운 비밀번호가 일치하는지 확인
	public int checkpw(ManagerVO check) {
		
		return sql.selectOne(url+"checkpw", check);
	}

	// 매니저 정보 보기
	public ManagerVO selectManager(String id) {

		return sql.selectOne(url+"selectManager", id);
	}

	// 매니저 정보 수정
	public ManagerVO updateManager(ManagerVO up) {
		sql.update(url+"updateManager", up);
		
		return sql.selectOne(url+"updateManager", up.getId());
	}
}
