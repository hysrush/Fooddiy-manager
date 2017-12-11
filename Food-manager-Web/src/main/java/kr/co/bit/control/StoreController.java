package kr.co.bit.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.service.StoreService;
import kr.co.bit.vo.PagingVO;
import kr.co.bit.vo.StoreVO;

@RequestMapping("/store")
@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	@RequestMapping(value="/storeList.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView storeList(HttpServletRequest request
									,HttpServletResponse response
									,PagingVO paging) {
		
		
		List<StoreVO> storeList =storeService.storeList(paging);
		
		paging.setTotal(storeService.selectTotalPaging());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("store/StoreList");
		
		mav.addObject("storeList", storeList);
		mav.addObject("p",paging);
		
		
		return mav;
	}
	
	
	
	
	
	
}
