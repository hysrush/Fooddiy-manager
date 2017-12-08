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
	
	
	// 회원가입
	public ManagerVO signUp(ManagerVO managerVO) {
		
		sql.insert("kr.co.bit.manager.dao.signUp", managerVO);
		
		return sql.selectOne(url+"login", managerVO);
		
	}
	
	// 로그인
	public ManagerVO login(ManagerVO login) {
		
		// API 가입 확인 또는 아이디 비밀번호 확인
		int check = sql.selectOne(url+"loginCheck", login);

		if(check == 0 ) {
			return null;
		}
			
		return sql.selectOne(url+"login", login);
		
		
	}

	// id 찾기
	public ManagerVO lostId(ManagerVO lost) {
		
		// 가입한 건지 확인
		int check = sql.selectOne("kr.co.bit.member.dao.lostIdCheck", lost);
		
		if(check == 0) {
			return null;
		}

		return sql.selectOne("kr.co.bit.member.dao.lostId", lost);

	}
	
	// pw 찾기
	public ManagerVO lostPw(ManagerVO lost) {
		
		int check = sql.selectOne("kr.co.bit.member.dao.lostPwCheck", lost);
		
		if(check == 0) {
			return null;
		}
		return sql.selectOne("kr.co.bit.member.dao.lostPw", lost);
	}

	// 임시 비밀번호 설정
	public void setPw(ManagerVO setpw) {
	
		sql.insert("kr.co.bit.member.dao.pwUpdate", setpw);
	}

	//가입했는지 확인
	public int checkMember(ManagerVO phoneCert) {
		
		System.out.println(phoneCert);
		return sql.selectOne("kr.co.bit.member.dao.checkMember", phoneCert);
	}
	
}
