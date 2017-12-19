package kr.co.bit.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.service.StoreService;
import kr.co.bit.vo.StoreVO;
import kr.co.bit.vo.locationVO;

@RequestMapping("/store")
@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	@RequestMapping(value="/storeList.do")
	public ModelAndView storeList(HttpServletRequest request
									,HttpServletResponse response
									) {
		
		
		List<StoreVO> storeList =storeService.storeList();
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("store/StoreList");
		
		mav.addObject("storeList", storeList);
		
		
		
		return mav;
	}
	//매장 추가 폼으로 이동 
		@RequestMapping(value = "/storeWrite.do", method = RequestMethod.GET)
		public String writeForm(HttpServletRequest request, HttpServletResponse response, Model model) {

			StoreVO storeVO = new StoreVO();

			model.addAttribute("storeVO", storeVO);

			return "store/StoreWriteForm";

		}

		// 새글 등록 하기
		@RequestMapping(value = "/storeWrite.do", method = RequestMethod.POST)
		public String write(@Valid StoreVO storeVO, BindingResult result
				){

		
			

			// eventVO에 저장
			storeService.insert(storeVO);

			return "redirect:/store/storeList.do";

		}
	
	
	
	
	
	
	
	 // 수정폼으로 이동
		@RequestMapping(value="/storeModifyForm.do" , method=RequestMethod.GET)
		public String reWriteForm(@RequestParam("no")int no ,Model model) {
			
			
			StoreVO storeVO = storeService.selectOne(no);
			
			model.addAttribute("storeVO", storeVO);
			
			
			System.out.println("1 : " + storeVO.toString());
			
			return "store/storeEditForm";
			
			
		}
		// 수정 
		@RequestMapping(value="/storeModifyForm.do" , method=RequestMethod.POST)
		public String reWrite(@Valid StoreVO storeVO, BindingResult result) {
		
			
			// QnA 새 글로 수정
			System.out.println("2 : " + storeVO.toString());
			
			storeService.update(storeVO);
			System.out.println("3 : " + storeVO.toString());
			
			return "redirect:/store/storeList.do";
	
			
		}
		
		
		@RequestMapping(value = "deleteStore.do", method= RequestMethod.GET)
		public String deleteStore(@RequestParam("no")int no) {
			
			storeService.delete(no);
			
			
			return "redirect:/store/storeList.do";
			
		}
	
	
		
		
		// 시정보 ajax
				@RequestMapping(value = "/test")
				public void chargeReqAjaxByToss(HttpServletRequest request, HttpServletResponse response,
						@RequestParam(value = "sido", defaultValue = "") String sido, Model model) throws Exception {

					response.setContentType("text/html;charset=UTF-8");
					JSONObject jsonObj = new JSONObject();

					// 1. Select 구 군 정보
					List<locationVO> locationList = storeService.selectLocation(sido);

					// 2. return value parse
					jsonObj.put("result", true);
					jsonObj.put("guList", locationList);

					response.getWriter().print(jsonObj.toString());

				}
	
	
	
	
}
