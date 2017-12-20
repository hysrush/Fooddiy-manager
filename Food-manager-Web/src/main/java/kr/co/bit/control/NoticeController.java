package kr.co.bit.control;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	public String test(@Valid NoticeBoardVO noticeVO, BindingResult result,
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
		fileOX = fileService.save(request, noticeVO.getNo());
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
			System.out.println("Test");
			// 해당 번호에 맞는 fileVO 읽어오기
			FileVO fileVO = fileService.selectOneFile(no);
			mav.addObject("fileVO", fileVO);
		}

		// 줄바꿈 
		mav.addObject("br", "<br/>");
		mav.addObject("cn", "\n");
		
		return mav;
	}
	// Notice 수정 폼
	// ex) community/subway/noticeEditForm.do?no=15
	@RequestMapping(value="/noticeEditForm.do", method=RequestMethod.GET)
	public String updateForm(@RequestParam("no") int no, Model model) {
		
		// 수정 전 내용 - 글번호로 읽어오기
		NoticeBoardVO noticeVO = noticeService.selectOneNotice(no);
		// 공유영역에 등록
		model.addAttribute("noticeVO", noticeVO);
		// Form에서 가져온 Data를 QnaBoardVO 객체 형태로 저장
		NoticeBoardVO noticeVO_NEW = new NoticeBoardVO();
		// 공유영역에 등록
		model.addAttribute("noticeVO_NEW", noticeVO_NEW);
		
		// file 존재하면,
		if (noticeVO.getFileOX().equals("O")) {
			// 해당 번호에 맞는 fileVO 읽어오기
			FileVO fileVO = fileService.selectOneFile(no);
			model.addAttribute("fileVO", fileVO);
		}
		FileVO fileVO_NEW = new FileVO();
		model.addAttribute("fileVO_NEW",fileVO_NEW);

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
    	
		// Notice 새 글로 수정
		noticeService.modifyNotice(noticeVO_NEW);
		System.out.println(noticeVO_NEW.toString());
		
		// fileVO 수정
		String fileOX = fileService.modifyFile(request, noticeVO_NEW.getNo());
		System.out.println("fileOX : " + fileOX);
		// 파일 저장했으면,
		if (fileOX.equals("O")) {
			// fileOX -> O 업데이트
			noticeService.updateFileOX_O(noticeVO_NEW.getNo());
		}
		// 파일 저장 안 했으면,
		if (fileOX.equals("X")){
			// fileOX -> X 업데이트
			noticeService.updateFileOX_X(noticeVO_NEW.getNo());
		}
		
		return "redirect:/community/subway/noticeList.do";
	}
	// Notice 글 삭제
	@RequestMapping(value="/noticeDelete.do", method=RequestMethod.GET)
	public String delete(@RequestParam("no") int no) {
		
		// file 존재하면,
		if (noticeService.selectOneNotice(no).getFileOX().equals("O")) { 
			// 번호에 해당하는 Notice 파일 삭제
			fileService.removeFile(no);
		}
		// 번호에 해당하는 Notice 글 삭제
		noticeService.removeNotice(no);
		
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
					// 리스트 번호에 해당하는 Notice 파일 삭제
					fileService.removeFileSome(list);
				}
			}
		}
		// 리스트 번호에 해당하는 Notice 글 삭제
		noticeService.removeNoticeSome(list);
		
		return "redirect:/community/subway/noticeList.do";
	}
}
