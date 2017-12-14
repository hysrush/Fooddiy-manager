package kr.co.bit.control;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.bit.service.SignService;
import kr.co.bit.vo.ManagerVO;

/**
 * 
 * 로그인, 로그아웃 회원가입
 * 
 */
@SessionAttributes({"loginVO"})
@RequestMapping("/sign")
@Controller
public class SignController {

	@Autowired
	private SignService signServiceImp;

	/**
	 * 
	 *  1. 관리자
	 * 	 (1) 가입
	 * 
	 */
	// 관리자 등록 페이지 이동
	@RequestMapping("/signUp")
	public String signUp(Model model) {
		
		model.addAttribute("managerVO", new ManagerVO());
		
		return "sign/signForm";
	}
	
	// 아이디 중복
	@RequestMapping(value="/signForm", method=RequestMethod.GET)
	public @ResponseBody String checkId(String id) {
		
		int num = signServiceImp.checkMember(id);
		
		if(num == 1) {
			return "X";
		}
		
		return "O";
	}
	// 관리자 인증 코드 발송
	@RequestMapping(value="/signForm", method=RequestMethod.POST)
	public @ResponseBody List<Object> managerCheck(String id) {
		
		String check = signServiceImp.managerCheck(id);
		List<Object> manager = new ArrayList<>();
		
		manager.add(check);
		manager.add("인증 코드 발송!");
		
		return manager;
	}

	// - 관리자 등록
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUpForm(ManagerVO managerVO, Model model) {
		
		ManagerVO loginVO = signServiceImp.signUp(managerVO);
		
		model.addAttribute("loginVO", loginVO);
		System.out.println(loginVO.toString());
		
		return "sign/sign";
	}

	/**
	 * 
	 *  (2) 로그인
	 * 
	 * */

	// 로그인 페이지
	@RequestMapping("/login")
	public String login() {
		
		return "sign/loginForm";
	}
	
	// => 로그인 실패시 다시 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginForm(ManagerVO login, Model model) {

		ManagerVO signIn = signServiceImp.login(login);

		if (signIn == null) {
			String msg = "아이디 또는 비밀번호를 확인해 주세요.";
			model.addAttribute("msg", msg);
			
			return "sign/loginForm";
		}
		
		model.addAttribute("loginVO", signIn);
		System.out.println(signIn.toString());
		model.addAttribute("url", "FirstPage");
		
		return "sign/sign";
	}

	// - 로그아웃
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus, Model model) {
		
		sessionStatus.setComplete();
		model.addAttribute("url", "login");
		return "sign/sign";
	}
		
	// pw 찾기 - 이메일로 전송
	@RequestMapping(value="/lostpw", method = RequestMethod.POST)
	public String lostPwForm(ManagerVO lost, Model model) {
		
		ManagerVO lostVO = signServiceImp.lostPw(lost);
		
		if( lostVO == null) {

			model.addAttribute("msg", "고객님이 입력하신 ID에 관한 정보가 없습니다. 확인 후 다시 이용해 주세요.");
			return "sign/loginForm";
		}
		
		
		model.addAttribute("msg", "고객님의 이메일로 임시 비밀번호가 전송되었습니다. 로그인 후 비밀번호를 꼭! 수정해 주세요.");
		
		return "sign/loginForm";
	}
	
	// 매니저 정보 상세 보기
	@RequestMapping("/profile")
	public String profile(String id) {
		
		return "sign/profile";
	}

	// 현재 비밀번호와 새로운 비밀번호가 일치하는지 확인
	@RequestMapping("/checkpw")
	public @ResponseBody int checkpw(ManagerVO check, Model model) {
		System.out.println(check.toString());
		return signServiceImp.checkpw(check);
	}
	
	// 비밀번호 변경
	@RequestMapping(value="/updatePassword", method=RequestMethod.POST)
	public String setPw(ManagerVO up, Model model) {
	
		signServiceImp.setPw(up);
		model.addAttribute("msg", "비밀번호가 변경되었습니다.");
		
		return "sign/profile";
	}
}
