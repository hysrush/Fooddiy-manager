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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.service.FileService;
import kr.co.bit.service.NoticeService;
import kr.co.bit.vo.FileVO;
import kr.co.bit.vo.NoticeBoardVO;

@RequestMapping("/community/subway")
@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	@Autowired
	private FileService fileService;
	
	// <Notice 컨트롤러>
	// 공지사항 전체보기
	@RequestMapping("/noticeList.do")
	public ModelAndView listAll() {
		
		List<NoticeBoardVO> noticeList = noticeService.selectAllNotice();
		
		ModelAndView mav = new ModelAndView();
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("community/subway/noticeList");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("noticeList", noticeList);
		
		return mav;
	}
	
	// Notice 새 글쓰기폼
	@RequestMapping(value="/noticeWriteForm.do", method=RequestMethod.GET)
	public String writeForm(Model model) {
		
		// Form에서 가져온 Data를 NoticeBoardVO 객체 형태로 저장
		NoticeBoardVO noticeVO = new NoticeBoardVO();
		// 공유영역에 등록
		model.addAttribute("noticeVO", noticeVO);
		
		return "community/subway/noticeWriteForm";
	}
	// Notice 새 글쓰기
	@RequestMapping(value="/noticeWriteForm.do", method=RequestMethod.POST)
	public String write(@Valid NoticeBoardVO noticeVO, BindingResult result,
						HttpServletRequest request, HttpSession session) throws Exception{

		if (result.hasErrors()) {
			// 에러일때 true => writeForm으로
			return "community/subway/noticeWriteForm";
		}
		
		// fileOX 기본값
		String fileOX = "X";
		
		// fileOX 등록
		noticeVO.setFileOX(fileOX);
		// Notice 새 글 등록
		noticeService.insertNotice(noticeVO);
		System.out.println(noticeVO.toString());
		
		// fileVO 저장
		fileOX = fileService.uploadFile(request, noticeVO.getNo());
		System.out.println("fileOX : " + fileOX);
		
		// 파일 저장했으면,
		if (fileOX.equals("O")) {
			// fileOX -> O 업데이트
			noticeService.updateFileOX_O(noticeVO.getNo());
		}
		
		String path = session.getServletContext().getRealPath("/");
		System.out.println("■path:::"+path);
		
		return "redirect:/community/subway/noticeList.do";
	}
	// Notice 글 상세내용 조회 & 게시글 조회수 증가 처리
	// ex) community/subway/noticeDetail.do?no=15
	@RequestMapping(value="/noticeDetail.do", method=RequestMethod.GET)
	public ModelAndView detail(@RequestParam("no") int no, HttpSession session) {

		// 조회수 증가 x, 사용자단의 조회수만 가져온다
		//noticeService.updateViewcntNotice(no, session);
		
		NoticeBoardVO noticeVO = noticeService.selectOneNotice(no);

		ModelAndView mav = new ModelAndView();
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("community/subway/noticeDetail");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("noticeVO", noticeVO);

		// file 존재하면,
		if (noticeVO.getFileOX().equals("O")) {
			// Mybatis에 매개변수 2개를 보내기 위해 map 생성
			Map<String, Object> fileMap = new HashMap<>();
			fileMap.put("boardNo", no);
			fileMap.put("name", "noticeFile");
			// 해당 번호에 맞는 fileVO 읽어오기
			FileVO fileVO = fileService.selectOneFile(fileMap);
			mav.addObject("fileVO", fileVO);
		}

		// 줄바꿈 
		mav.addObject("br", "<br/>");
		mav.addObject("cn", "\n");
		
		return mav;
	}
	// file 다운로드
	@RequestMapping(value="/downloadFile.do", method=RequestMethod.GET)
	public String download(@RequestParam(value="no") int boardNo, HttpServletResponse response) {
		
		try {
			// Mybatis에 매개변수 2개를 보내기 위해 map 생성
			Map<String, Object> fileMap = new HashMap<>();
			fileMap.put("boardNo", boardNo);
			fileMap.put("name", "noticeFile");
			fileService.downloadFile(response, fileMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "";
	}
	// Notice 수정 폼
	// ex) community/subway/noticeEditForm.do?no=15
	@RequestMapping(value="/noticeEditForm.do", method=RequestMethod.GET)
	public String updateForm(@RequestParam("no") int no, Model model) {
		
		// 수정 전 내용 - 글번호로 읽어오기
		NoticeBoardVO noticeVO = noticeService.selectOneNotice(no);
		// 공유영역에 등록
		model.addAttribute("noticeVO", noticeVO);
		// Form에서 가져온 Data를 NoticeBoardVO 객체 형태로 저장
		NoticeBoardVO noticeVO_NEW = new NoticeBoardVO();
		// 공유영역에 등록
		model.addAttribute("noticeVO_NEW", noticeVO_NEW);
		
		// file 존재하면,
		if (noticeVO.getFileOX().equals("O")) {
			// Mybatis에 매개변수 2개를 보내기 위해 map 생성
			Map<String, Object> fileMap = new HashMap<>();
			fileMap.put("boardNo", no);
			fileMap.put("name", "noticeFile");
			// 해당 번호에 맞는 fileVO 읽어오기
			FileVO fileVO = fileService.selectOneFile(fileMap);
			model.addAttribute("fileVO", fileVO);
		}

		return "community/subway/noticeEditForm";
	}
	// Notice 업데이트
	@RequestMapping(value="/noticeEditForm.do", method=RequestMethod.POST)
	public String update(@Valid NoticeBoardVO noticeVO_NEW, BindingResult result,
						HttpServletRequest request) {
		
		if (result.hasErrors()) {
			// 에러일때 true => editForm으로
			return "community/subway/noticeEditForm";
		}
    	System.out.println("temp 값 : " + noticeVO_NEW.getTemp());
		String fileOX = "";
		
		// Notice 새 글로 수정
		noticeService.modifyNotice(noticeVO_NEW);
		System.out.println(noticeVO_NEW.toString());
		
		System.out.println("기존 fileOX : " + noticeVO_NEW.getFileOX());
		
		/* FileVO */
		// 기존 파일 X
		if (noticeVO_NEW.getFileOX().equals("X")) {
			// fileVO 저장
			fileOX = fileService.uploadFile(request, noticeVO_NEW.getNo());
			System.out.println("fileOX : " + fileOX);
			/* NoticeBoardVO */
			// -> 파일 저장했으면,
			if (fileOX.equals("O")) {
				// fileOX -> O 업데이트
				noticeService.updateFileOX_O(noticeVO_NEW.getNo());
			}
			// 파일 저장 안 했으면,
			if (fileOX.equals("X")){
				// fileOX -> X 업데이트
				noticeService.updateFileOX_X(noticeVO_NEW.getNo());
			}
		}
		// 기존 파일 O
		if (noticeVO_NEW.getFileOX().equals("O")) {
			// Mybatis에 매개변수 2개를 보내기 위해 map 생성
			Map<String, Object> fileMap = new HashMap<>();
			fileMap.put("boardNo", noticeVO_NEW.getNo());
			fileMap.put("name", "noticeFile");
			// 기존 파일의 파일 주소
			String filePath = fileService.selectOneFile(fileMap).getFilePath();
			System.out.println("기존 파일의 파일주소 : " + filePath);
			// fileVO 수정
			fileOX = fileService.modifyFile(request, noticeVO_NEW.getNo());
			System.out.println("수정 fileOX : " + fileOX);
			/* NoticeBoardVO */
			// -> 파일 저장했으면,
			if (fileOX.equals("O")) {
				// fileOX -> O 업데이트
				noticeService.updateFileOX_O(noticeVO_NEW.getNo());
				// 수정 전 파일 삭제
				fileService.deleteFile(filePath);
			}
			// -> 파일 저장 안 했으면,
			if (fileOX.equals("X")){
				if (noticeVO_NEW.getTemp().equals("YES")) {
					// fileOX -> O 업데이트
					noticeService.updateFileOX_O(noticeVO_NEW.getNo());
				} else {
					// fileOX -> X 업데이트
					noticeService.updateFileOX_X(noticeVO_NEW.getNo());
					// 파일 삭제
					fileService.removeFile(fileMap);
				}
			}
		}
		
		return "redirect:/community/subway/noticeList.do";
	}
	// Notice 글 삭제
	@RequestMapping(value="/noticeDelete.do", method=RequestMethod.GET)
	public String delete(@RequestParam("no") int no) {
		
		// file 존재하면,
		if (noticeService.selectOneNotice(no).getFileOX().equals("O")) { 
			// Mybatis에 매개변수 2개를 보내기 위해 map 생성
			Map<String, Object> fileMap = new HashMap<>();
			fileMap.put("boardNo", no);
			fileMap.put("name", "noticeFile");
			// 번호에 해당하는 Notice 파일 삭제
			fileService.removeFile(fileMap);
			// 번호에 해당하는 Notice 글 삭제
			noticeService.removeNotice(no);
		} else {
			// 번호에 해당하는 Notice 글 삭제
			noticeService.removeNotice(no);
		}
		
		return "redirect:/community/subway/noticeList.do";
	}
	// Notice 글 다중 삭제
	@RequestMapping(value="/noticeDeleteSome.do", method=RequestMethod.GET)
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
				if (noticeService.selectOneNotice(num).getFileOX().equals("O")) { 
					// Mybatis에 매개변수 2개를 보내기 위해 map 생성
					Map<String, Object> fileMap = new HashMap<>();
					fileMap.put("boardNo", num);
					fileMap.put("name", "noticeFile");
					/* 실제 저장된 파일 삭제 */
					// 사용자
					String userPath = "C:\\Users\\bit-user\\git\\Fooddiy\\Food-diy-Web\\src\\main\\webapp\\upload\\notice" 
										+ File.separator + fileService.selectOneFile(fileMap).getFilePath();
					File file = new File(userPath);
					if(file.exists() == true){
						file.delete();
					}
					// 관리자
					String adminPath = "C:\\Users\\bit-user\\git\\Fooddiy\\Food-diy-Web\\src\\main\\webapp\\upload\\notice"
										+ File.separator + fileService.selectOneFile(fileMap).getFilePath();
					File file2 = new File(adminPath);
					if(file2.exists() == true){
						file2.delete();
					}
					/* DB 삭제 */
					// 리스트 번호에 해당하는 Notice 파일 삭제
					fileService.removeFileSome(list);
					// 리스트 번호에 해당하는 Notice 글 삭제
					noticeService.removeNoticeSome(list);
				} else {
					// 리스트 번호에 해당하는 Notice 글 삭제
					noticeService.removeNoticeSome(list);
				}
			}
		}
		
		return "redirect:/community/subway/noticeList.do";
	}
}
