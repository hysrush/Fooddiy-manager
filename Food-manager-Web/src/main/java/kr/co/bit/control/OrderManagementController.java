package kr.co.bit.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bit.service.OrderManagementService;
import kr.co.bit.vo.OrderVO;

@Controller
@RequestMapping("/orderManagement")
public class OrderManagementController {
	
	@Autowired
	OrderManagementService service;
	
	
	@RequestMapping("/totalOrderList.do")
	public String totalOrderList() {
		
		List<OrderVO> totalOrderList = service.selectAll();
		
		return "/totalOrderList";
	}
	
	@RequestMapping("/todayOrderList.do")
	public String todayOrderList() {
		
		List<OrderVO> todayOrderList = service.selectByToday();
		
		return "todayOrderList";
	}
	
	@RequestMapping("/orderList.do")
	public String orderList() {
		
		List<OrderVO> orderList = service.selectByNo();
		
		return "orderList";
	}
}
