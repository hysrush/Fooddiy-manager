package kr.co.bit.control;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
 * 로그인, 로그아웃 회원가입 API로그인 처리
 * 
 */
@SessionAttributes({"loginVO"})
@RequestMapping("/manager")
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
	
	// - 관리자 등록
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUp(ManagerVO managerVO, Model model) {
		
		ManagerVO loginVO = signServiceImp.signUp(managerVO);
		
		model.addAttribute("loginVO", loginVO);
		model.addAttribute("msg", "가입 성공~!");
		
		return "sign/sign";
	}

	/**
	 * 
	 *  (2) 로그인
	 * 
	 * */
	
	// 로그인 화면
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String signInForm() {

		
		return "sign/login";
	}

	// => 로그인 실패시 다시 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String signIn(ManagerVO login, Model model) {

		ManagerVO signIn = signServiceImp.login(login);

		if (signIn == null) {
			String msg = "아이디 또는 비밀번호를 확인해 주세요.";
			model.addAttribute("msg", msg);
			
			return "sign/login";
		}
		
		model.addAttribute("loginVO", signIn);
		
		return "sign/sign";
	}

	// - 로그아웃
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus, Model model) {
		
		sessionStatus.setComplete();
		return "sign/sign";
	}
	
	
	// - id 찾기 - alert창
	@RequestMapping("/lostId")
	public String lostId(ManagerVO lost, Model model) {
		
		ManagerVO lostVO = signServiceImp.lostId(lost);
		
		if(lostVO == null) {
			model.addAttribute("msg", "입력하신 정보에 해당하는 가입 이력이 없습니다. "
					+ "회원가입 후 이용해 주세요.");
			return "sign/login";
		
		}
		// 아이디 일부 **처리
		model.addAttribute("msg", "고객님의 아이디는 <"+lostVO.getId()+"> 입니다.");
		/*model.addAttribute("lostId", lostVO.getId());*/
		
		return "sign/login";
	}
	
	// - pw 찾기 - 이메일로 전송
	@RequestMapping("/lostPw")
	public String lostPw(ManagerVO lost, Model model) {
		
		ManagerVO lostVO = signServiceImp.lostPw(lost);
		
		if( lostVO == null) {
			model.addAttribute("msg", "고객님이 입력하신 ID에 관한 정보가 없습니다. 확인 후 다시 이용해 주세요.");
			return "sign/login";
		}
		
		model.addAttribute("msg", "고객님의 이메일로 비밀번호가 전송되었습니다.");
		
		return "sign/login";
	}


	// 이메일 인증 코드 발송
	@RequestMapping("/nonemail")
	public @ResponseBody List<Object> nonMemberCheck(ManagerVO nonMember, Model model) {
		
		List<Object> list = new ArrayList<>();
		String key = signServiceImp.sender(nonMember);
		
		list.add(key);
		list.add(nonMember);
		
		return list;
	}

	// 이메일 인증 후 session 객체에만 등록
	@RequestMapping(value="/nonemailCheck")
	public String nonMemberSign(ManagerVO nonMember, Model model, HttpSession session) {
		
		ManagerVO user = signServiceImp.nonSignUp(nonMember);
		
		session.setAttribute("nonMember", user);
			
		return "sign/sign";
	}
	
	// session저장만 할 것임
	@RequestMapping("/nonlogout")
	public String nonLogout(String id, HttpSession session) {
		
		session.invalidate();
		
		return "sign/logout";
		
	}
	
}
