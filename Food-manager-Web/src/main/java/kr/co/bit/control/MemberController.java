package kr.co.bit.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.bit.service.MemberService;
import kr.co.bit.vo.UserVO;

@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	//회원목록 보기
	@RequestMapping(value="/memberList.do")
	public String memberList( Model model) throws Exception {
		
		List<UserVO> UserVO = memberService.selectMemberList();
		model.addAttribute("memberList", UserVO);
		return "member/memberList";
	}
	
	
}
