package kr.co.bit.control;

import java.util.ArrayList;
import java.util.List;

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

import kr.co.bit.service.NoticeService;
import kr.co.bit.vo.NoticeBoardVO;

@RequestMapping("/community/subway")
@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	// <Notice 컨트롤러>
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
	
	/*// 공지사항 전체보기
	@RequestMapping("/noticeList.do")
	public ModelAndView	listNotice() {
		
		ModelAndView mav = new ModelAndView();
		
		List<NoticeBoardVO> noticeList = noticeService.selectType("A");
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("community/subway/noticeList");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("noticeList", noticeList);
		
		
		// ex) http://localhost:8000/Food-diy-Web/community/noticeDetail.do?no=6
		String[] referer = request.getHeader("referer").split("/");
		// ex) noticeDetail.do?no=6
		String url = referer[referer.length - 1];
		String[] t = url.split("=");
		// ex) noticeDetail.do?no
		String page = t[0];
		// ex) 6
		String no = t[t.length - 1];
		
		System.out.println(page + " || " + no);
		
		if (page.equals("noticeDetail.do?no")) {
			for (NoticeBoardVO noticeBoardVO : noticeList) {
				if (noticeBoardVO.getNo() == Integer.parseInt(no)) {
					String BackUrlType =  noticeBoardVO.getType();
					System.out.println("디테일 url의 타입 : " + BackUrlType);
					mav.addObject("BackUrlType", BackUrlType);
				}
			}
		}
		
		return mav;
	}
	
	// 보도자료 전체보기
	@RequestMapping("/newsList.do")
	public ModelAndView listNews() {
		
		ModelAndView mav = new ModelAndView();
		
		List<NoticeBoardVO> newsList = noticeService.selectType("B");
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("community/subway/newsList");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("newsList", newsList);
		
		return mav;
	}*/
	
	// Notice 새 글쓰기폼
	@RequestMapping(value="/noticeWriteForm.do", method=RequestMethod.GET)
	public String writeForm(Model model) {
		
		// Form에서 가져온 Data를 NoticeBoardVO 객체 형태로 저장
		NoticeBoardVO noticeVO = new NoticeBoardVO();
		// 공유영역에 등록
		model.addAttribute("noticeVO", noticeVO);
		
		return "community/subway/noticeWriteForm";
		//return "community/subway/test";
	}
	// Notice 새 글쓰기
	@RequestMapping(value="/noticeWriteForm.do", method=RequestMethod.POST)
	public String write(@Valid NoticeBoardVO noticeVO, BindingResult result) {
		
		if (result.hasErrors()) {
			// 에러일때 true => writeForm으로
			return "community/subway/noticeWriteForm";
			//return "community/subway/test";
		}
		// Notice 새 글 등록
		noticeService.insertNotice(noticeVO);
		
		System.out.println(noticeVO.toString());
		
		return "redirect:/community/subway/noticeList.do";
	}
	// Notice 글 상세내용 조회 & 게시글 조회수 증가 처리
	// ex) community/subway/noticeDetail.do?no=15
	@RequestMapping(value="/noticeDetail.do", method=RequestMethod.GET)
	public ModelAndView detail(@RequestParam("no") int no, HttpSession session) {

		// 조회수 증가
		noticeService.updateViewcntNotice(no, session);
		
		NoticeBoardVO noticeVO = noticeService.selectOneNotice(no);
		
		ModelAndView mav = new ModelAndView();
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("community/subway/noticeDetail");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("noticeVO", noticeVO);
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
		
		return "community/subway/noticeEditForm";
	}
	// Notice 업데이트
	@RequestMapping(value="/noticeEditForm.do", method=RequestMethod.POST)
	public String update(@Valid NoticeBoardVO noticeVO_NEW, BindingResult result) {
		if (result.hasErrors()) {
			// 에러일때 true => editForm으로
			return "community/subway/noticeEditForm";
		}
		// Notice 새 글로 수정
		noticeService.modifyNotice(noticeVO_NEW);
		
		System.out.println(noticeVO_NEW.toString());
		
		return "redirect:/community/subway/noticeList.do";
	}
	// Notice 글 삭제
	@RequestMapping(value="/noticeDelete.do", method=RequestMethod.GET)
	public String delete(@RequestParam("no") int no) {
		
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
				list.add(new Integer(array[i]));
			}
		}
		// 리스트 번호에 해당하는 Notice 글 삭제
		noticeService.removeNoticeSome(list);
		
		return "redirect:/community/subway/noticeList.do";
	}
}
