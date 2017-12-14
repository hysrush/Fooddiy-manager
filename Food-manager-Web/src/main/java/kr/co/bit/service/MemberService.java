package kr.co.bit.service;

import java.util.List;

import kr.co.bit.vo.UserVO;

public interface MemberService {

	public List<UserVO> selectMemberList();

	public UserVO selectid(String id); 
		



}
