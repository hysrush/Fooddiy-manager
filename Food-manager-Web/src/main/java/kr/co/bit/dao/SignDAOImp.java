package kr.co.bit.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.vo.UserVO;

@Repository
public class SignDAOImp implements SignDAO {

	@Autowired
	private SqlSessionTemplate sql;
	String url = "kr.co.bit.member.dao.";
	
	// 로그인
	public UserVO login(UserVO login) {
		
		// API 가입 확인 또는 아이디 비밀번호 확인
		int check = sql.selectOne("kr.co.bit.member.dao.loginCheck", login);

		if(check == 0 ) {
			return null;
		}
			
		return sql.selectOne("kr.co.bit.member.dao.login", login);
		
	}

	// 회원가입
	public void signUp(UserVO memberVO) {
		
		sql.insert("kr.co.bit.manager.dao.signUp", memberVO);
		
	}

	// id 찾기
	public UserVO lostId(UserVO lost) {
		
		// 가입한 건지 확인
		int check = sql.selectOne("kr.co.bit.member.dao.lostIdCheck", lost);
		
		if(check == 0) {
			return null;
		}

		return sql.selectOne("kr.co.bit.member.dao.lostId", lost);

	}
	
	// pw 찾기
	public UserVO lostPw(UserVO lost) {
		
		int check = sql.selectOne("kr.co.bit.member.dao.lostPwCheck", lost);
		
		if(check == 0) {
			return null;
		}
		return sql.selectOne("kr.co.bit.member.dao.lostPw", lost);
	}

	// 임시 비밀번호 설정
	public void setPw(UserVO setpw) {
	
		sql.insert("kr.co.bit.member.dao.pwUpdate", setpw);
	}

	//가입했는지 확인
	public int checkMember(UserVO phoneCert) {
		
		System.out.println(phoneCert);
		return sql.selectOne("kr.co.bit.member.dao.checkMember", phoneCert);
	}
	
}
