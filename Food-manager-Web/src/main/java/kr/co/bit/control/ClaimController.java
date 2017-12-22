package kr.co.bit.control;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.bit.service.ClaimService;
import kr.co.bit.service.EventService;
import kr.co.bit.vo.CityVO;
import kr.co.bit.vo.ClaimBoardVO;
import kr.co.bit.vo.StoreVO;
import kr.co.bit.vo.UserVO;

@RequestMapping("/community")
@Controller
public class ClaimController {
	
	@Autowired
	private ClaimService claimService;
	@Autowired
	private EventService eventService;
	
	// <Claim 컨트롤러>
	// Claim 전체보기
	@RequestMapping("/claim.do")
	public ModelAndView listAll() {
		
		List<ClaimBoardVO> claimList = claimService.selectAllClaim();
		
		ModelAndView mav = new ModelAndView();
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("community/claimList");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("claimList", claimList);
		
		return mav;
	}
	
	// Claim 새 글쓰기폼
	@RequestMapping(value="/claimWrite.do", method=RequestMethod.GET)
	public String writeForm(Model model, HttpSession session) {
		
		List<CityVO> cityList = eventService.selectCity();
		
		// Form에서 가져온 Data를 ClaimBoardVO 객체 형태로 저장
		ClaimBoardVO claimVO = new ClaimBoardVO();

		// 로그인 회원 정보 가져오기
		UserVO signIn = (UserVO)session.getAttribute("loginVO");
		
		// 1) 이메일
		String loginEmail = signIn.getEmail();
		String[] fullEmail = loginEmail.split("@");
		String emailId = fullEmail[0];
		String emailDomain = fullEmail[1];
		
		model.addAttribute("emailId", emailId);
		model.addAttribute("emailDomain", emailDomain);
		
		// 2) 휴대폰
		String loginPhone = signIn.getPhone();
		String[] fullPhone = loginPhone.split("-");
		String middleNum = fullPhone[1];
		String lastNum = fullPhone[2];
		
		model.addAttribute("middleNum", middleNum);
		model.addAttribute("lastNum", lastNum);
		
		// 공유영역에 등록
		model.addAttribute("claimVO", claimVO);
		model.addAttribute("cityList", cityList);
		
		return "community/claimWrite";
	}
	
	// Claim 새 글쓰기
	@RequestMapping(value="/claimWrite.do", method=RequestMethod.POST)
	public String write(@Valid ClaimBoardVO claimVO, BindingResult result,
						@RequestParam(value="file") MultipartFile file, RedirectAttributes r) throws Exception {
		
		if (result.hasErrors()) {
			// 에러일때 true => writeForm으로
			System.out.println("test");
			//return "community/claimWrite";
		}
		
		if (file != null) {
			// 파일 업로드
			System.out.println(file.getOriginalFilename());
			
			// 1. fileName 설정 + eventVO에 fileName 저장
			String fileName = "C:\\Users\\bit-user\\git\\Fooddiy\\Food-diy-Web\\src\\main\\webapp\\upload\\"
					+ file.getOriginalFilename();
			String saveFileName = file.getOriginalFilename();
			
			claimVO.setFile(saveFileName);
			
			System.out.println(fileName);
			System.out.println(saveFileName);
			System.out.println("들어가나");
			
			// 2. 경로에 이미지파일 저장
			byte[] bytes;
			bytes = file.getBytes();
			BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(new File(fileName)));
			buffStream.write(bytes);
			buffStream.close();
			
			System.out.println("들어가나 2");
			
		}
		
		// Claim 새 글 등록
		claimService.insertClaim(claimVO);
		r.addAttribute("id", claimVO.getWriter());
		
		System.out.println(claimVO.getWriter());
		return "redirect:/member/myQnA.do";
	}
	
	// Claim 글 상세내용 조회 & 게시글 조회수 증가 처리
	// ex) community/claimDetail.do?no=15
	@RequestMapping(value="/claimDetail.do", method=RequestMethod.GET)
	public ModelAndView detail(@RequestParam("no") int no, HttpSession session) {
		
		// 조회수 증가
		claimService.updateViewcntClaim(no, session);
		
		ClaimBoardVO claimVO = claimService.selectOneClaim(no);
		
		ModelAndView mav = new ModelAndView();
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("community/claimDetail");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("claimVO", claimVO);
		
		return mav;
	}
	
	// 시정보 ajax
	@RequestMapping(value = "/sido")
	public void chargeReqAjaxByToss(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "sido", defaultValue = "") String sido, Model model) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		JSONObject jsonObj = new JSONObject();

		// 1. Select 구 군 정보
		List locationList = eventService.selectLocation(sido);

		// 2. return value parse
		jsonObj.put("result", true);
		jsonObj.put("guList", locationList);

		response.getWriter().print(jsonObj.toString());

	}

	// 시,도 군,구 정보 ajax
	@RequestMapping(value = "/gugun")
	public void gugunajax(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "gugun", defaultValue = "") String gugun, Model model) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		JSONObject jsonObj = new JSONObject();

		List<StoreVO> storeList = eventService.selectStoreList(gugun);

		for (int i = 0; i < storeList.size(); i++) {
			System.out.println(storeList.get(i).toString());
		}
		
		System.out.println("선택한 구군 :" + gugun);

		String locationName = eventService.locationName(gugun);
		
		System.out.println("선택한 구군 이름 :" + locationName);

		jsonObj.put("storeList", storeList);
		jsonObj.put("locationName", (Object)locationName);
		
		response.getWriter().print(jsonObj.toString());

	}
	
	// 스토어 이름 검색 ajax
	@RequestMapping(value = "/search")
	public void storeNameAjax(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "search", defaultValue = "") String search, Model model) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		JSONObject jsonObj = new JSONObject();
		
		List<StoreVO> searchList = eventService.searchStoreName(search);
		
		for (int i = 0; i < searchList.size(); i++) {
			System.out.println(searchList.get(i).toString());
		}
		
		System.out.println("검색한 매장명 :" + search);
		
		// 검색된 데이터가 있으면 list, 없으면 null 리턴
		if (searchList.size() >= 1) {
			System.out.println("데이터 있음");
		} else {
			System.out.println("데이터 없음");
			searchList = null;
		}
		jsonObj.put("searchList", searchList);
		
		response.getWriter().print(jsonObj.toString());
	}
	
	// 클레임 타입
	@ModelAttribute("typeCode")
	public Map<String, String> getTypeCode() {
		
		Map<String, String> typeCode = new HashMap<>();
		
		typeCode.put("I", "문의");
		typeCode.put("P", "칭찬");
		typeCode.put("C", "불만");
		typeCode.put("S", "제안");
		typeCode.put("X", "기타");
		
		/*
		Iterator<String> iterator = typeCode.keySet().iterator();
	    while (iterator.hasNext()) {
	        String key = (String) iterator.next();
	        System.out.print("key="+key);
	        System.out.println(" value="+ typeCode.get(key));
	    }
		*/
		return typeCode;
	}
	// 이메일 도메인
	@ModelAttribute("domainCode")
	public List<String> getDomainCode() {
		
		List<String> domainCode = new ArrayList<>();
		
		domainCode.add("gmail.com");
		domainCode.add("hanmail.net");
		domainCode.add("hotmail.com");
		domainCode.add("nate.com");
		domainCode.add("naver.com");
		domainCode.add("yahoo.co.kr");
		domainCode.add("hanmir.com");
		domainCode.add("lycos.co.kr");
		domainCode.add("empal.com");
		domainCode.add("hitel.net");
		domainCode.add("freechal.com");
		
		//System.out.println(domainCode.toString());
		
		return domainCode;
	}
	
}
