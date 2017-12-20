package kr.co.bit.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.service.SnsService;
import kr.co.bit.vo.PagingVO;
import kr.co.bit.vo.SnsBoardVO;

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
	
	
	
	
	
	
	
	
}
