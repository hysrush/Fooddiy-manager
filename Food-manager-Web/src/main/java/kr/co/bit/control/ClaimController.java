package kr.co.bit.control;

import java.io.File;
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
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.service.ClaimService;
import kr.co.bit.service.EventService;
import kr.co.bit.service.FileService;
import kr.co.bit.vo.CityVO;
import kr.co.bit.vo.ClaimBoardVO;
import kr.co.bit.vo.FileVO;
import kr.co.bit.vo.StoreVO;
import kr.co.bit.vo.UserVO;

@RequestMapping("/community/claim")
@Controller
public class ClaimController {
	
	@Autowired
	private ClaimService claimService;
	@Autowired
	private EventService eventService;
	@Autowired
	private FileService fileService;
	
	// <Claim 컨트롤러>
	// Claim 전체보기
	@RequestMapping("/claimList.do")
	public ModelAndView listAll() {
		
		List<ClaimBoardVO> claimList = claimService.selectAllClaim();
		
		ModelAndView mav = new ModelAndView();
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("community/claim/claimList");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("claimList", claimList);
		
		return mav;
	}
	
	// Claim 새 글쓰기폼
	@RequestMapping(value="/claimWriteForm.do", method=RequestMethod.GET)
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
		
		return "community/claim/claimWriteForm";
	}
	
	// Claim 새 글쓰기
	@RequestMapping(value="/claimWriteForm.do", method=RequestMethod.POST)
	public String write(@Valid ClaimBoardVO claimVO, BindingResult result,
			HttpServletRequest request, HttpSession session) throws Exception{
		
		if (result.hasErrors()) {
			// 에러일때 true => writeForm으로
			return "community/claim/claimWriteForm";
		}
		
		// fileOX 기본값
		String fileOX = "X";
		
		// fileOX 등록
		claimVO.setFileOX(fileOX);
		// Claim 새 글 등록
		claimService.insertClaim(claimVO);
		System.out.println(claimVO.toString());
		
		fileOX = fileService.uploadFile(request, claimVO.getNo());
		System.out.println("fileOX : " + fileOX);
		
		// 파일 저장했으면,
		if (fileOX.equals("O")) {
			// fileOX -> O 업데이트
			claimService.updateFileOX_O(claimVO.getNo());
		}
		
		String path = session.getServletContext().getRealPath("/");
		System.out.println("■path:::"+path);
		
		return "redirect:/community/claim/claimWriteForm.do";
	}
	
	// Claim 글 상세내용 조회 & 게시글 조회수 증가 처리
	// ex) community/claimDetail.do?no=15
	@RequestMapping(value="/claimDetail.do", method=RequestMethod.GET)
	public ModelAndView detail(@RequestParam("no") int no, HttpSession session) {
		
		ClaimBoardVO claimVO = claimService.selectOneClaim(no);
		
		ModelAndView mav = new ModelAndView();
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("community/claim/claimDetail");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("claimVO", claimVO);
		
		// file 존재하면,
		if (claimVO.getFileOX().equals("O")) {
			// 해당 번호에 맞는 fileVO 읽어오기
			List<FileVO> fileList = fileService.selectFileList(no, "claimFile");
			mav.addObject("fileList",fileList);
		}

		// 줄바꿈 
		mav.addObject("br", "<br/>");
		mav.addObject("cn", "\n");
		
		return mav;
	}
	// file 다운로드
	@RequestMapping(value="/downloadFile.do", method=RequestMethod.GET)
	public void download(@RequestParam(value="no") int no, HttpServletResponse response) {
		
		try {
			fileService.downloadFile(response, no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	// Claim 수정 폼
	// ex) community/claim/claimEditForm.do?no=15
	@RequestMapping(value="/claimEditForm.do", method=RequestMethod.GET)
	public String updateForm(@RequestParam("no") int no, Model model) {
		
		// 수정 전 내용 - 글번호로 읽어오기
		ClaimBoardVO claimVO = claimService.selectOneClaim(no);
		// 공유영역에 등록
		model.addAttribute("claimVO", claimVO);
		// Form에서 가져온 Data를 ClaimBoardVO 객체 형태로 저장
		ClaimBoardVO claimVO_NEW = new ClaimBoardVO();
		// 공유영역에 등록
		model.addAttribute("claimVO_NEW", claimVO_NEW);
		
		// file 존재하면,
		if (claimVO.getFileOX().equals("O")) {
			// 해당 번호에 맞는 fileVO 읽어오기
			List<FileVO> fileList = fileService.selectFileList(no, "claimFile");
			model.addAttribute("fileList", fileList);
		}

		return "community/claim/claimEditForm";
	}
	// Claim 업데이트
	@RequestMapping(value="/claimEditForm.do", method=RequestMethod.POST)
	public String update(@Valid ClaimBoardVO claimVO_NEW, BindingResult result,
						HttpServletRequest request) {
		
		if (result.hasErrors()) {
			// 에러일때 true => editForm으로
			return "community/claim/claimWriteForm";
		}
    	System.out.println("temp 값 : " + claimVO_NEW.getTemp());
		String fileOX = "";
		
		// Claim 새 글로 수정
		claimService.modifyClaim(claimVO_NEW);
		System.out.println(claimVO_NEW.toString());
		
		System.out.println("기존 fileOX : " + claimVO_NEW.getFileOX());
		
		/* FileVO */
		// 기존 파일 X
		if (claimVO_NEW.getFileOX().equals("X")) {
			// fileVO 저장
			fileOX = fileService.uploadFile(request, claimVO_NEW.getNo());
			System.out.println("fileOX : " + fileOX);
			/* ClaimBoardVO */
			// -> 파일 저장했으면,
			if (fileOX.equals("O")) {
				// fileOX -> O 업데이트
				claimService.updateFileOX_O(claimVO_NEW.getNo());
			}
			// 파일 저장 안 했으면,
			if (fileOX.equals("X")){
				// fileOX -> X 업데이트
				claimService.updateFileOX_X(claimVO_NEW.getNo());
			}
		}
		// 기존 파일 O
		if (claimVO_NEW.getFileOX().equals("O")) {
			// 해당 번호에 맞는 fileVO 읽어오기
			List<FileVO> fileList = fileService.selectFileList(claimVO_NEW.getNo(), "claimFile");
			for (FileVO fileVO : fileList) {
				// 기존 파일의 파일 주소
				String filePath = fileVO.getFilePath();
				System.out.println("기존 파일의 파일주소 : " + filePath);
				// fileVO 수정
				fileOX = fileService.modifyFile(request, fileVO.getNo());
				System.out.println("수정 fileOX : " + fileOX);
				
				/* ClaimBoardVO */
				// -> 파일 저장했으면,
				if (fileOX.equals("O")) {
					// fileOX -> O 업데이트
					claimService.updateFileOX_O(fileVO.getNo());
					// 수정 전 파일 삭제
					fileService.deleteFile(filePath);
				}
				// -> 파일 저장 안 했으면,
				if (fileOX.equals("X")){
					if (claimVO_NEW.getTemp().equals("YES")) {
						// fileOX -> O 업데이트
						claimService.updateFileOX_O(fileVO.getNo());
					} else {
						// fileOX -> X 업데이트
						claimService.updateFileOX_X(fileVO.getNo());
						// 파일 삭제
						fileService.removeFile(fileVO.getNo());
					}
				}
			}
		}
		
		return "redirect:/community/claim/claimList.do";
	}
	// Claim 글 삭제
	@RequestMapping(value="/claimDelete.do", method=RequestMethod.GET)
	public String delete(@RequestParam("no") int no) {
		
		// file 존재하면,
		if (claimService.selectOneClaim(no).getFileOX().equals("O")) { 
			// 해당 번호에 맞는 fileVO 읽어오기
			List<FileVO> fileList = fileService.selectFileList(no, "claimFile");
			for (FileVO fileVO : fileList) {
				// 번호에 해당하는 Claim 파일 삭제
				fileService.removeFile(fileVO.getNo());
			}
			// 번호에 해당하는 Claim 글 삭제
			claimService.removeClaim(no);
		} else {
			// 번호에 해당하는 Claim 글 삭제
			claimService.removeClaim(no);
		}
		
		return "redirect:/community/claim/claimList.do";
	}
	// Claim 글 다중 삭제
	@RequestMapping(value="/claimDeleteSome.do", method=RequestMethod.GET)
	public String deleteSome(@RequestParam("nums") String nums) {
		
		// 번호 쪼개기
		String[] array = nums.split(",");
		
		for (int i = 0; i < array.length; i++) {
			System.out.println("array ["+ i +"]번째 : " +array[i]);
		}
		// 리스트에 넣기
		ArrayList<Integer> list = new ArrayList<>();
		for(int i=0; i<array.length; i++) {
			// null값이 아닐때
			if (!array[i].equals("")) {
				Integer num = new Integer(array[i]);
				list.add(num);
				// file 존재하면,
				if (claimService.selectOneClaim(num).getFileOX().equals("O")) { 
					/* 실제 저장된 파일 삭제 */
					// 사용자
					String userPath = "C:\\Users\\bit-user\\git\\Fooddiy\\Food-diy-Web\\src\\main\\webapp\\upload" 
										+ File.separator + fileService.selectFileList(num, "claimFile").get(i).getFilePath();
					File file = new File(userPath);
					if(file.exists() == true){
						file.delete();
					}
					// 관리자
					String adminPath = "C:\\Users\\bit-user\\git\\Fooddiy\\Food-diy-Web\\src\\main\\webapp\\upload"
										+ File.separator + fileService.selectFileList(num, "claimFile").get(i).getFilePath();
					File file2 = new File(adminPath);
					if(file2.exists() == true){
						file2.delete();
					}
					/* DB 삭제 */
					// 리스트 번호에 해당하는 Claim 파일 삭제
					fileService.removeFileSome(list);
					// 리스트 번호에 해당하는 Claim 글 삭제
					claimService.removeClaimSome(list);
				} else {
					// 리스트 번호에 해당하는 Claim 글 삭제
					claimService.removeClaimSome(list);
				}
			}
		}
		
		return "redirect:/community/claim/claimList.do";
	}
	
	// **************************************************************
	// 매장찾기
	// **************************************************************
	
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
		
		return domainCode;
	}
	
}
