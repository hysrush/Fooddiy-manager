package kr.co.bit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.dao.MemberDAO;
import kr.co.bit.vo.UserVO;

@Service
public class MemberServiceImp implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public List<UserVO> selectMemberList() {
		List<UserVO> list = memberDAO.selectAll();
		return list;
	}

}
