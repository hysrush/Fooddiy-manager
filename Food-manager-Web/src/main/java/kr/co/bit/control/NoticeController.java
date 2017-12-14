package kr.co.bit.control;

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

import kr.co.bit.service.NoticeService;
import kr.co.bit.vo.NoticeBoardVO;

@RequestMapping("/community")
@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	// <Notice 컨트롤러>
	// Notice 전체보기
	@RequestMapping("/notice.do")
	public ModelAndView	listNotice(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		List<NoticeBoardVO> noticeList = noticeService.selectType("A");
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("community/noticeList");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("noticeList", noticeList);
		
		/*
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
		*/
		return mav;
	}
	
	// 보도자료 전체보기
	@RequestMapping("/news.do")
	public ModelAndView listNews() {
		
		ModelAndView mav = new ModelAndView();
		
		List<NoticeBoardVO> newsList = noticeService.selectType("B");
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("community/newsList");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("newsList", newsList);
		
		return mav;
	}
	
	// Notice 새 글쓰기폼
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.GET)
	public String writeForm(Model model) {
		
		// Form에서 가져온 Data를 NoticeBoardVO 객체 형태로 저장
		NoticeBoardVO noticeVO = new NoticeBoardVO();
		// 공유영역에 등록
		model.addAttribute("noticeVO", noticeVO);
		
		return "community/noticeWrite";
	}
	// Notice 새 글쓰기
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.POST)
	public String write(@Valid NoticeBoardVO noticeVO, BindingResult result) {
		
		if (result.hasErrors()) {
			// 에러일때 true => writeForm으로
			return "community/noticeWrite";
		}
		// Notice 새 글 등록
		noticeService.insertNotice(noticeVO);
		
		return "redirect:/community/notice.do";
	}
	// Notice 글 상세내용 조회 & 게시글 조회수 증가 처리
	// ex) community/noticeDetail.do?no=15
	@RequestMapping(value="/noticeDetail.do", method=RequestMethod.GET)
	public ModelAndView detail(@RequestParam("no") int no, HttpSession session) {

		// 조회수 증가
		noticeService.updateViewcntNotice(no, session);
		
		NoticeBoardVO noticeVO = noticeService.selectOneNotice(no);
		
		ModelAndView mav = new ModelAndView();
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("community/noticeDetail");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("noticeVO", noticeVO);
		
		return mav;
	}
}
