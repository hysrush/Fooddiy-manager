package kr.co.bit.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.vo.UserVO;

@Repository
public class MemberDAOImp implements MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<UserVO> selectAll() {
		List<UserVO> list = sqlSession.selectList("kr.co.bit.dao.memberList");
		return list;
	}

	@Override
	public UserVO selectid(String id) {
		return sqlSession.selectOne("kr.co.bit.dao.memberDetail",id);
	}

}
