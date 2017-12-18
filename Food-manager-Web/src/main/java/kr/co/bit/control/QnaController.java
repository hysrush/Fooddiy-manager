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
		
		System.out.println(qnaVO.toString());
		
		return "redirect:/community/qna/qnaList.do";
	}
	// QnA 글 상세내용 조회
	// ex) community/qna/qnaDetail.do?no=15
	@RequestMapping(value="/qnaDetail.do", method=RequestMethod.GET)
	public ModelAndView detail(@RequestParam("no") int no) {

		QnaBoardVO qnaVO = qnaService.selectOneQnA(no);
		
		int qnaLength = qnaVO.getQuestion().length();
		
		ModelAndView mav = new ModelAndView();
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("community/qna/qnaDetail");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("qnaVO", qnaVO);
		// 줄바꿈 
		mav.addObject("br", "<br/>");
		mav.addObject("cn", "\n");
		// 질문 문자열 길이
		mav.addObject("qnaLength", qnaLength);
		
		return mav;
	}
	// QnA 수정 폼
	// ex) community/qna/qnaEditForm.do?no=15
	@RequestMapping(value="/qnaEditForm.do", method=RequestMethod.GET)
	public String updateForm(@RequestParam("no") int no, Model model) {
		
		// 수정 전 내용 - 글번호로 읽어오기
		QnaBoardVO qnaVO = qnaService.selectOneQnA(no);
		// 공유영역에 등록
		model.addAttribute("qnaVO", qnaVO);
		
		// Form에서 가져온 Data를 QnaBoardVO 객체 형태로 저장
		QnaBoardVO qnaVO_NEW = new QnaBoardVO();
		// 공유영역에 등록
		model.addAttribute("qnaVO_NEW", qnaVO_NEW);
		
		return "community/qna/qnaEditForm";
//		return "community/qna/edit";
	}
	// QnA 업데이트
	@RequestMapping(value="/qnaEditForm.do", method=RequestMethod.POST)
	public String update(@Valid QnaBoardVO qnaVO_NEW, BindingResult result) {
		if (result.hasErrors()) {
			// 에러일때 true => editForm으로
			return "community/qna/qnaEditForm";
		}
		// QnA 새 글로 수정
		qnaService.modifyQnA(qnaVO_NEW);
		
		System.out.println(qnaVO_NEW.toString());
		
		return "redirect:/community/qna/qnaList.do";
	}
	// QnA 글 삭제
	@RequestMapping(value="/qnaDelete.do", method=RequestMethod.GET)
	public String delete(@RequestParam("no") int no) {
		
		// 번호에 해당하는 QnA 글 삭제
		qnaService.removeQnA(no);
		
		return "redirect:/community/qna/qnaList.do";
	}
	// QnA 글 다중 삭제
	@RequestMapping(value="/qnaDeleteSome.do", method=RequestMethod.GET)
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
		// 리스트 번호에 해당하는 QnA 글 삭제
		qnaService.removeQnASome(list);
		
		return "redirect:/community/qna/qnaList.do";
	}
}
