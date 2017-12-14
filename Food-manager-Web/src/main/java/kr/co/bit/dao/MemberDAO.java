package kr.co.bit.dao;

import java.util.List;

import kr.co.bit.vo.UserVO;

public interface MemberDAO {
	
	List<UserVO> selectAll();

	UserVO selectid(String id);
}
