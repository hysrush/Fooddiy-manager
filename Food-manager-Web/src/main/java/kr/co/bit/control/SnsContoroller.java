package kr.co.bit.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.service.SnsService;
import kr.co.bit.vo.PagingVO;
import kr.co.bit.vo.SnsBoardVO;
import kr.co.bit.vo.SnsRepVO;

@RequestMapping("/community/sns")
@Controller
public class SnsContoroller {

	
	@Autowired
	private SnsService snsService;
	
	
	
	
	@RequestMapping(value ="/snsPage.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView paging(HttpServletRequest request
							, HttpServletResponse response
							, PagingVO paging) {
		
		
		List<SnsBoardVO> snsList = snsService.selectSns(paging);
		
		
		
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("community/sns/snsList");
		
		mav.addObject("snsList" , snsList);
		
		
		
		return mav;
			
		
	}
	
	@RequestMapping(value="/snsDetail.do", method=RequestMethod.GET)
	public ModelAndView detail(@RequestParam("no") int no
			, HttpSession session
			, PagingVO paging) {		
		
		SnsBoardVO snsVO = snsService.selectOne(no);
		
		
		
		
		ModelAndView mav = new ModelAndView();
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("community/sns/snsDetail");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("snsVO", snsVO);
		
		
		
		return mav;
	}
	

	@RequestMapping(value = "/deleteSns.do")
	public String deleteEvent(@RequestParam("no")int no) {
		
		snsService.delete(no);
		
		
		return "redirect:/community/sns/snsPage.do";
		
	}
	
	
	
	
}
