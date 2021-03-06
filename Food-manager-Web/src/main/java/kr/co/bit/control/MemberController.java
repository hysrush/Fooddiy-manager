package kr.co.bit.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.bit.service.MemberService;
import kr.co.bit.vo.UserVO;

@RequestMapping("/member")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	//회원목록 보기
	@RequestMapping("/memberList.do")
	public String memberList(Model model) throws Exception {
		List<UserVO> UserVO = memberService.selectMemberList();
		model.addAttribute("memberList", UserVO);
		System.out.println(UserVO.toString());
		return "member/memberList";
	}
	
	@RequestMapping("/memberDetail.do")
	public String memberDetail(@RequestParam String id, Model model) {
		
		UserVO userVO = memberService.selectid(id);
		System.out.println(userVO.toString());
		model.addAttribute("user", userVO);
		
		return "member/memberDetail";
	}
	
}
