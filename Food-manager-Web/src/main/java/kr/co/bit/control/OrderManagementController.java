package kr.co.bit.control;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.service.OrderManagementService;
import kr.co.bit.vo.DetailOrderVO;
import kr.co.bit.vo.OrderVO;

@Controller
@RequestMapping("/orderManagement")
public class OrderManagementController {
	
	@Autowired
	OrderManagementService service;
	
	
	@RequestMapping("/totalOrderList.do")
	public String totalOrderList() {
		
		List<OrderVO> totalOrderList = service.selectAll();
		
		return "orderManagement/todayOrderDetail";
		//return "orderManagement/totalOrderList";
	}
	
	@RequestMapping("/todayOrderList.do")
	public ModelAndView todayOrderList(ModelAndView mav) {
		
		String pattern = "yy/MM/dd";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String today = sdf.format(new Date()).toString();
		
		
		List<OrderVO> todayOrderList = service.selectByToday(today);
		
		for(int i = 0 ; i < todayOrderList.size(); ++i) {

			List<DetailOrderVO> list = new LinkedList<DetailOrderVO>();
			String menu = todayOrderList.get(i).getMenu();
			String [] menus = menu.split("\\|\\|");
			
			System.out.println("menus.length =  " + menus.length);
			
			for(int j = 0; j < menus.length; ++j) {
				DetailOrderVO vo = new DetailOrderVO();
				String [] oneMenu = menus[j].split("\\|");

				vo.setName(oneMenu[0]);
				vo.setBread(oneMenu[1]);
				vo.setCheese(oneMenu[2]);
				vo.setTopping(oneMenu[3]);
				vo.setVegetable(oneMenu[4]);
				vo.setSauce(oneMenu[5]);
				vo.setRequirement(oneMenu[6]);
				vo.setPic(oneMenu[7]);
				vo.setSize(oneMenu[8]);
				vo.setQty(new Integer(oneMenu[9]));
				vo.setPrice(oneMenu[10]);
				vo.setTotal_price(oneMenu[11]);
				list.add(vo);
			}
			todayOrderList.get(i).setDetailOrderList(list);
		}
		
		System.out.println(todayOrderList);
		mav.setViewName("orderManagement/todayOrderList");
		mav.addObject("orderList", todayOrderList);
		return mav;
	}
	@RequestMapping(value = "/orderCancel.do", method = RequestMethod.GET)
	public String cancelOrder(@RequestParam("no") int no) {
		
		service.cancelOrder(no);
		
		return "redirect:/orderManagement/todayOrderList.do";
		
	}
	
	
	@RequestMapping(value = "/todayOrderDetail.do", method = RequestMethod.GET) 
	public ModelAndView orderDetail(ModelAndView mav, @RequestParam("no") int no) {
		
		OrderVO orderVO = service.selectByNo(no);
		
		String menu = orderVO.getMenu();
		String [] menus = menu.split("\\|\\|");
		
		
		List<DetailOrderVO> list = new LinkedList<DetailOrderVO>();
		for(int i = 0 ; i < menus.length; ++i) {
			DetailOrderVO vo = new DetailOrderVO();
			String [] oneMenu = menus[i].split("\\|");
			
			vo.setName(oneMenu[0]);
			vo.setBread(oneMenu[1]);
			vo.setCheese(oneMenu[2]);
			vo.setTopping(oneMenu[3]);
			vo.setVegetable(oneMenu[4]);
			vo.setSauce(oneMenu[5]);
			vo.setRequirement(oneMenu[6]);
			vo.setPic(oneMenu[7]);
			vo.setSize(oneMenu[8]);
			vo.setQty(new Integer(oneMenu[9]));
			vo.setPrice(oneMenu[10]);
			vo.setTotal_price(oneMenu[11]);
			
			list.add(vo);
		}
		
		orderVO.setDetailOrderList(list);
		
		mav.addObject("orderVO", orderVO);
		mav.setViewName("orderManagement/todayOrderDetail");
		
		return mav;
	}
	
	@RequestMapping("/orderList.do")
	public String orderList() {
		
		//List<OrderVO> orderList = service.selectByNo();
		
		return "orderManagement/orderList.do";
	}
	
	
}
