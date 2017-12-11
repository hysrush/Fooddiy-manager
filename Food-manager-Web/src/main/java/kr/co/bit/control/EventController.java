package kr.co.bit.control;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.service.EventService;
import kr.co.bit.vo.CityVO;
import kr.co.bit.vo.EventBoardVO;
import kr.co.bit.vo.PagingVO;
import kr.co.bit.vo.StoreVO;

@RequestMapping("/event")
@Controller
public class EventController {

	@Autowired
	private EventService eventService;

	
	
	
	
	// 진행중인 이벤트 , 종료된 이벤트 보기
	/*@RequestMapping("/eventPage.do")
	public ModelAndView list(HttpServletRequest request
							, HttpServletResponse response) {
		List<EventBoardVO> eventList = eventService.selectAllEvent();
		List<EventBoardVO> eventEndList = eventService.selectEndEvent();

		ModelAndView mav = new ModelAndView();
		// setViewName : �뼱�뼡 �럹�씠吏�瑜� 蹂댁뿬以꾧쾬�씤媛�
		mav.setViewName("event/EventPage");
		// addObject : key �� value 瑜� �떞�븘 蹂대궡�뒗 硫붿꽌�뱶
		
	
		
		

		mav.addObject("eventList", eventList);
		mav.addObject("eventEndList", eventEndList);

		return mav;

	}
	*/
	@RequestMapping(value ="/eventPage.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView paging(HttpServletRequest request
							, HttpServletResponse response
							, PagingVO paging) {
		
		
		List<EventBoardVO> eventList = eventService.selectPaging(paging);
		List<EventBoardVO> eventEndList = eventService.selectEndEvent(paging);
		paging.setTotal(eventService.selectTotalPaging());
		ModelAndView mav = new ModelAndView();
		
		System.out.println(eventService.selectTotalPaging());
		
		mav.setViewName("event/EventPage");
		
		mav.addObject("eventList" , eventList);
		mav.addObject("eventEndList", eventEndList);
		mav.addObject("p",paging);
		
		
		return mav;
			
		
	}
	
	
	
	
	
	
	
	

	// 매장별 이벤트 , 종료된 매장별 이벤트 보기
	@RequestMapping("/storeEventPage.do")
	public ModelAndView StoreList() {

		List<CityVO> cityList = eventService.selectCity();

		List<EventBoardVO> eventList = eventService.selectAllEvent();
		
		ModelAndView mav = new ModelAndView();

		mav.setViewName("event/StoreEventPage");

		mav.addObject("cityList", cityList);

		
		mav.addObject("eventList",eventList);
		mav.addObject("cityList", cityList );
		
		System.out.println("얘가져옴?");

		return mav;
	}

	// 시정보 ajax
	@RequestMapping(value = "/test")
	public void chargeReqAjaxByToss(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "sido", defaultValue = "") String sido, Model model) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		JSONObject jsonObj = new JSONObject();

		// 1. Select 구 군 정보
		List locationList = eventService.selectLocation(sido);

		// 2. return value parse
		jsonObj.put("result", true);
		jsonObj.put("guList", locationList);

		response.getWriter().print(jsonObj.toString());

	}

	// 시,도 군,구 정보 ajax
	@RequestMapping(value = "/test3")
	public void gugunajax(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "gugun", defaultValue = "") String gugun, Model model) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		JSONObject jsonObj = new JSONObject();

		List<StoreVO> storeList = eventService.selectStoreList(gugun);

		for (int i = 0; i < storeList.size(); i++) {
			System.out.println(storeList.get(i).toString());
		}

		jsonObj.put("result", true);
		jsonObj.put("storeList", storeList);

		response.getWriter().print(jsonObj.toString());

	}
	 // 마커에 위치표시 
	@RequestMapping(value="/test4")
	public void eventAjax(HttpServletRequest request
								, HttpServletResponse response
								, @RequestParam(value ="store", defaultValue ="") String store
								, Model model) throws Exception {
		
		System.out.println(store);
		
		response.setContentType("text/html;charset=UTF-8");
		JSONObject jsonObj = new JSONObject();
		
		List<EventBoardVO> eventList = eventService.selectEventBystoreName(store);
		
		for(int i = 0 ; i < eventList.size(); i++ ) {
			System.out.println(eventList.get(i).toString());
		}
		
		
		
		jsonObj.put("result", true);
		jsonObj.put("eventList", eventList);
		
		response.getWriter().print(jsonObj.toString());
		
	}
	

	// 새글등록 폼으로 보내기
	@RequestMapping(value = "/eventWrite.do", method = RequestMethod.GET)
	public String writeForm(HttpServletRequest request, HttpServletResponse response, Model model) {

		EventBoardVO eventVO = new EventBoardVO();

		model.addAttribute("eventVO", eventVO);

		return "event/EventWriteForm";

	}

	// 새글 등록 하기
	@RequestMapping(value = "/eventWrite.do", method = RequestMethod.POST)
	public String write(@Valid EventBoardVO eventVO, BindingResult result,
			@RequestParam(value = "imgFileName") MultipartFile file) throws Exception {

		System.out.println("시작");

		// 1. fileName 설정 + eventVO에 fileName 저장
		String fileName = "C:\\Users\\bit-user\\git\\Fooddiy-manager\\Food-manager-Web\\src\\main\\webapp\\upload\\"
				+ file.getOriginalFilename();
		String uFileName = "C:\\Users\\bit-user\\git\\Fooddiy\\Food-diy-Web\\src\\main\\webapp\\upload\\"
				+ file.getOriginalFilename();
		String saveFileName = file.getOriginalFilename();

		eventVO.setImgFileName(saveFileName);

		System.out.println(fileName);
		System.out.println(saveFileName);
		System.out.println("들어가나");

		// 2. 경로에 이미지파일 저장
		byte[] bytes;
		bytes = file.getBytes();
		BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(new File(fileName)));
		buffStream.write(bytes);
		buffStream.close();
		//사용자 upload 폴더에 저장
		byte[] ubyte;
		ubyte = file.getBytes();
		BufferedOutputStream buffStreams = new BufferedOutputStream(new FileOutputStream(new File(uFileName)));
		buffStreams.write(ubyte);
		buffStreams.close();
		
		
		System.out.println("들어가나 2");

		// eventVO에 저장
		eventService.insertEvent(eventVO);

		return "redirect:/event/eventPage.do";

	}
	
	// 글번호로 디테일 페이지 이동 
	@RequestMapping(value="/eventDetail.do",method=RequestMethod.GET)
	public ModelAndView detail(@RequestParam("no") int no, HttpSession session) {
		
		
		EventBoardVO eventVO = eventService.selectOneEvent(no);
				
				
		ModelAndView mav = new ModelAndView();		
		mav.setViewName("event/EventDetail");
		mav.addObject("eventVO",eventVO);
		
		
		return mav;
		
	}
	
	
	 // 수정폼으로 이동
	@RequestMapping(value="/reWrite.do" , method=RequestMethod.GET)
	public ModelAndView reWriteForm(@RequestParam("no")int no, HttpSession session) {
		
		
		EventBoardVO eventVO = eventService.selectOneEvent(no);
		ModelAndView mav = new ModelAndView();	
		
		mav.setViewName("event/EventReWriteForm");
		mav.addObject("eventVO", eventVO);
		
		return mav;
		
		
	}
	// 수정 
	@RequestMapping(value="/reWrite.do" , method=RequestMethod.POST)
	public String reWrite(@Valid EventBoardVO eventVO, BindingResult result,
			@RequestParam(value = "imgFileName") MultipartFile file)throws Exception {
				
		System.out.println("요기1");

		// 1. fileName 설정 + eventVO에 fileName 저장
		String fileName = "C:\\Users\\bit-user\\git\\Fooddiy-manager\\Food-manager-Web\\src\\main\\webapp\\upload\\"
				+ file.getOriginalFilename();
		String uFileName = "C:\\Users\\bit-user\\git\\Fooddiy\\Food-diy-Web\\src\\main\\webapp\\upload\\"
				+ file.getOriginalFilename();
		String saveFileName = file.getOriginalFilename();

		eventVO.setImgFileName(saveFileName);

		System.out.println(fileName);
		System.out.println(saveFileName);
		System.out.println("들어가나");

		// 2. 경로에 이미지파일 저장
		byte[] bytes;
		bytes = file.getBytes();
		BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(new File(fileName)));
		buffStream.write(bytes);
		buffStream.close();
		//사용자 upload 폴더에 저장
		byte[] ubyte;
		ubyte = file.getBytes();
		BufferedOutputStream buffStreams = new BufferedOutputStream(new FileOutputStream(new File(uFileName)));
		buffStreams.write(ubyte);
		buffStreams.close();
		System.out.println("요기2");
		
		
		eventService.modifyEvent(eventVO);
		System.out.println("요기3");
		
		return "redirect:/event/eventPage.do";
		
		
		
	}
	
	
	@RequestMapping(value = "delete.do")
	public String deleteEvent(@RequestParam("no")int no) {
		
		eventService.removeEvent(no);
		
		
		return "redirect:/event/eventPage.do";
		
	}
	
	
}




