package kr.co.bit.control;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
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
	
	//전제주문내역
	@RequestMapping("/totalOrderList.do")
	public ModelAndView totalOrderList(ModelAndView mav) {
		
		List<OrderVO> totalOrderList = service.selectAll();
		
		for(int i = 0 ; i < totalOrderList.size(); ++i) {

			List<DetailOrderVO> list = new LinkedList<DetailOrderVO>();
			String menu = totalOrderList.get(i).getMenu();
			String [] menus = menu.split("\\|\\|");
			
			System.out.println("menus.length =  " + menus.length);
			
			for(int j = 0; j < menus.length; ++j) {
				DetailOrderVO vo = new DetailOrderVO();
				String [] oneMenu = menus[j].split("\\*");

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
			totalOrderList.get(i).setDetailOrderList(list);
		}
		
		System.out.println(totalOrderList);
		mav.setViewName("orderManagement/totalOrderList");
		mav.addObject("orderList", totalOrderList);
		return mav;
	}
	
	
	//오늘주문내역
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
				String [] oneMenu = menus[j].split("\\*");

				vo.setName(oneMenu[0]);;
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
	
	//주문취소
	@RequestMapping(value = "/orderCancel.do", method = RequestMethod.GET)
	public String cancelOrder(@RequestParam("no") int no, @RequestParam("url") String url) {
		
		service.cancelOrder(no);
		
		return "redirect:/orderManagement/"+ url +".do";
		
	}
	
	//주문완료	
	@RequestMapping(value = "/orderComplete.do", method = RequestMethod.GET) 
	public void completeOrder(@RequestParam("no") int no, HttpServletResponse response) {
		service.completeOrder(no);
	}
	
	//전체, 오늘주문 상세내용 - 모달
	@RequestMapping(value = "/todayOrderDetail.do", method = RequestMethod.GET) 
	public ModelAndView orderDetail(ModelAndView mav, @RequestParam("no") int no) {
		
		OrderVO orderVO = service.selectByNo(no);
		
		String menu = orderVO.getMenu();
		String [] menus = menu.split("\\|\\|");
		
		
		List<DetailOrderVO> list = new LinkedList<DetailOrderVO>();
		for(int i = 0 ; i < menus.length; ++i) {
			DetailOrderVO vo = new DetailOrderVO();
			String [] oneMenu = menus[i].split("\\*");
			
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
	
	//현재 주문 
	@RequestMapping( value = "/orderList.do" , method = RequestMethod.GET)
	public ModelAndView orderList(ModelAndView mav) {
		
		List<OrderVO> orderList = service.selectByorderStatus();
		
		for(int i = 0 ; i < orderList.size(); ++i) {

			List<DetailOrderVO> list = new LinkedList<DetailOrderVO>();
			String menu = orderList.get(i).getMenu();
			String [] menus = menu.split("\\|\\|");
			
			System.out.println("menus.length =  " + menus.length);
			
			for(int j = 0; j < menus.length; ++j) {
				DetailOrderVO vo = new DetailOrderVO();
				String [] oneMenu = menus[j].split("\\*");

				vo.setName(oneMenu[0]);;
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
			orderList.get(i).setDetailOrderList(list);
		}
		
		
		mav.addObject("orderList", orderList);
		mav.setViewName("orderManagement/orderList");
		
		return mav;
	}
	
	
	//ajax 실시간으로 주문정보 불러오기
	@RequestMapping( value = "/orderList.do" , method = RequestMethod.POST)
	public void orderList(HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		
		JSONArray jsonOrderList = new JSONArray();
		List<OrderVO> orderList = service.selectByorderStatus();
		
		for(int i = 0 ; i < orderList.size(); ++i) {

			List<DetailOrderVO> list = new LinkedList<DetailOrderVO>();
			JSONObject jsonOneOrder = new JSONObject();
			JSONArray jsonDetailOrderList = new JSONArray();
			
			jsonOneOrder.put("no", orderList.get(i).getNo());
			jsonOneOrder.put("storeName", orderList.get(i).getStoreName());
			jsonOneOrder.put("id", orderList.get(i).getId());
			jsonOneOrder.put("order_price", orderList.get(i).getOrder_price());
			jsonOneOrder.put("final_price", orderList.get(i).getFinal_price());
			jsonOneOrder.put("eatType", orderList.get(i).getEatType());
			jsonOneOrder.put("payment", orderList.get(i).getPayment());
			jsonOneOrder.put("orderStatus", orderList.get(i).getOrderStatus());
			jsonOneOrder.put("regDate", orderList.get(i).getRegDate());
			
			
			String menu = orderList.get(i).getMenu();
			String [] menus = menu.split("\\|\\|");
			
			System.out.println("menus.length =  " + menus.length);
			
			for(int j = 0; j < menus.length; ++j) {
				JSONObject jsonDetailOrder = new JSONObject();
				DetailOrderVO vo = new DetailOrderVO();
				String [] oneMenu = menus[j].split("\\*");
				
				jsonDetailOrder.put("name", oneMenu[0]);
				jsonDetailOrder.put("bread", oneMenu[1]);
				jsonDetailOrder.put("cheese", oneMenu[2]);
				jsonDetailOrder.put("topping", oneMenu[3]);
				jsonDetailOrder.put("vegetable", oneMenu[4]);
				jsonDetailOrder.put("sauce", oneMenu[5]);
				jsonDetailOrder.put("requirement", oneMenu[6]);
				jsonDetailOrder.put("pic", oneMenu[7]);
				jsonDetailOrder.put("size", oneMenu[8]);
				jsonDetailOrder.put("qty", oneMenu[9]);
				jsonDetailOrder.put("price", oneMenu[10]);
				jsonDetailOrder.put("total_price", oneMenu[11]);
				
				jsonDetailOrderList.put(jsonDetailOrder);
			}
			System.out.println(jsonDetailOrderList.toString());
			jsonOneOrder.put("detailOrderList", jsonDetailOrderList.toString());
			
			jsonOrderList.put(jsonOneOrder);
			
		}

		response.getWriter().print(jsonOrderList.toString());
	}
	
}
