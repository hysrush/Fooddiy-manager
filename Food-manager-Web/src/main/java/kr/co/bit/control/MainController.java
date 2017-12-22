package kr.co.bit.control;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.bit.service.EventService;
import kr.co.bit.service.NoticeService;
import kr.co.bit.service.OrderManagementService;
import kr.co.bit.service.QnaService;
import kr.co.bit.vo.EventBoardVO;
import kr.co.bit.vo.ManagerVO;
import kr.co.bit.vo.NoticeBoardVO;

@RequestMapping("/main")
@Controller
public class MainController {

	@Autowired
	private EventService eventService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private OrderManagementService orderService;
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping("/FirstPage")
	public String mainPage(Model model, @RequestParam(value="storeName", required=false) String storeName) {
		
		List<EventBoardVO> eventList = eventService.selectEventMain();
		List<NoticeBoardVO> noticeList = noticeService.selectNoticeMain();
		System.out.println(storeName);
		/*List<QnaBoardVO> qnaList = qnaService.selectQnaMain(storeName);*/
		
		Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
        /*System.out.println("현재날짜 : "+ sdf.format(d));*/
       
        // 주문 건수 
        ManagerVO m = new ManagerVO();
        
        /* 어제 주문 건수
        Calendar y = Calendar.getInstance();
        y.add(Calendar.DATE, -1);
        
        
        m.setBranch(storeName);
        m.setDate(sdf.format(y.getTime()));
        
        int yesNum = orderService.selectTodayMain(m);
        */
        		
        // 오늘 주문 건수
        m.setBranch(storeName);
        m.setDate(sdf.format(d));
        
		int todyNum = orderService.selectTodayMain(m);
		
		model.addAttribute("event", eventList);
		model.addAttribute("notice", noticeList);
		/*model.addAttribute("qna", qnaList);*/
		model.addAttribute("count", todyNum);
		
		return "main/FirstPage";
	}
	
}
