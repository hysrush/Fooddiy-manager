package kr.co.bit.control;

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

import kr.co.bit.service.QnaService;
import kr.co.bit.vo.QnaBoardVO;

@RequestMapping("/community/qna")
@Controller
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	// <QnA 컨트롤러>
	// QnA 전체보기
	@RequestMapping("/qnaList.do")
	public ModelAndView	listAll() {
		
		List<QnaBoardVO> qnaList = qnaService.selectAllQnA();
		
		ModelAndView mav = new ModelAndView();
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("community/qna/qnaList");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("qnaList", qnaList);
		
		return mav;
	}
	// QnA 새 글쓰기폼
	@RequestMapping(value="/qnaWriteForm.do", method=RequestMethod.GET)
	public String writeForm(Model model) {
		
		// Form에서 가져온 Data를 QnaBoardVO 객체 형태로 저장
		QnaBoardVO qnaVO = new QnaBoardVO();
		// 공유영역에 등록
		model.addAttribute("qnaVO", qnaVO);
		
		return "community/qna/qnaWriteForm";
	}
	// QnA 새 글쓰기
	@RequestMapping(value="/qnaWriteForm.do", method=RequestMethod.POST)
	public String write(@Valid QnaBoardVO qnaVO, BindingResult result) {
		
		if (result.hasErrors()) {
			// 에러일때 true => writeForm으로
			return "community/qna/qnaWriteForm";
		}
		// QnA 새 글 등록
		qnaService.insertQnA(qnaVO);
		
		return "redirect:/community/qna/qnaList.do";
	}
	// QnA 글 상세내용 조회 & 게시글 조회수 증가 처리
	// ex) community/qnaDetail.do?no=15
	@RequestMapping(value="/qnaDetail.do", method=RequestMethod.GET)
	public ModelAndView detail(@RequestParam("no") int no, HttpSession session) {

		QnaBoardVO qnaVO = qnaService.selectOneQnA(no);
		
		ModelAndView mav = new ModelAndView();
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("community/qna/qnaDetail");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("qnaVO", qnaVO);
		
		return mav;
	}

}
