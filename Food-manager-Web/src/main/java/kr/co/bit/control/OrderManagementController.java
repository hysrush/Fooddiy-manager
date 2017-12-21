package kr.co.bit.control;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

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
import kr.co.bit.util.Order;
import kr.co.bit.vo.DetailOrderVO;
import kr.co.bit.vo.OrderVO;

@Controller
@RequestMapping("/orderManagement")
public class OrderManagementController {

	@Autowired
	OrderManagementService service;

	// 전제주문내역
	@RequestMapping(value = "/totalOrderList.do", method = RequestMethod.GET)
	public ModelAndView totalOrderList(ModelAndView mav) {

		List<OrderVO> totalOrderList = service.selectAll();

		// 세부메뉴 변환
		totalOrderList = Order.splitDetailOrderList(totalOrderList);

		mav.addObject("orderList", totalOrderList);
		mav.setViewName("orderManagement/totalOrderList");
		return mav;
	}

	// 전체주뭄내역 - 날짜검색
	@RequestMapping(value = "/totalOrderList.do", method = RequestMethod.POST)
	public ModelAndView orderListSelectByDate(ModelAndView mav, @RequestParam("type") String type,
			@RequestParam("date_start") String dateStart, @RequestParam("date_end") String dateEnd) {

		// Mybatis에 매개변수 2개를 보내기 위해 map 생성
		Map<String, String> date = new HashMap<>();
		date.put("dateStart", dateStart);
		date.put("dateEnd", dateEnd);

		List<OrderVO> orderListDate = service.selectByDate(date);

		// 세부메뉴로 변환
		orderListDate = Order.splitDetailOrderList(orderListDate);

		
		
		mav.addObject("type", type);
		mav.addObject("date", date);
		mav.addObject("orderList", orderListDate);
		mav.setViewName("orderManagement/totalOrderList");

		return mav;
	}

	// 오늘주문내역
	@RequestMapping("/todayOrderList.do")
	public ModelAndView todayOrderList(ModelAndView mav) {

		// 오늘 날짜 구하기
		String pattern = "yy/MM/dd";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String today = sdf.format(new Date()).toString();

		List<OrderVO> todayOrderList = service.selectByToday(today);

		// 세부메뉴로 변환
		todayOrderList = Order.splitDetailOrderList(todayOrderList);

		mav.addObject("orderList", todayOrderList);
		mav.setViewName("orderManagement/todayOrderList");
		return mav;
	}

	// 주문취소
	@RequestMapping(value = "/orderCancel.do", method = RequestMethod.GET)
	public String cancelOrder(@RequestParam("no") int no, @RequestParam("url") String url, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		service.cancelOrder(no);

		return "redirect:/orderManagement/" + url + ".do";

	}

	// 주문완료
	@RequestMapping(value = "/orderComplete.do", method = RequestMethod.GET)
	public void completeOrder(@RequestParam("no") int no, HttpServletResponse response) {
		service.completeOrder(no);
	}

	// 전체, 오늘주문 상세내용 - 모달
	@RequestMapping(value = "/todayOrderDetail.do", method = RequestMethod.GET)
	public ModelAndView orderDetail(ModelAndView mav, @RequestParam("no") int no) {

		OrderVO orderVO = service.selectByNo(no);

		String menu = orderVO.getMenu();
		String[] menus = menu.split("\\|\\|");

		List<DetailOrderVO> list = new LinkedList<DetailOrderVO>();
		for (int i = 0; i < menus.length; ++i) {
			DetailOrderVO vo = new DetailOrderVO();
			String[] oneMenu = menus[i].split("\\*");

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

	// 현재 주문
	@RequestMapping(value = "/orderList.do", method = RequestMethod.GET)
	public ModelAndView orderList(ModelAndView mav) {

		List<OrderVO> currentOrderList = service.selectByorderStatus();

		// 세부메뉴로 변환
		currentOrderList = Order.splitDetailOrderList(currentOrderList);

		mav.addObject("orderList", currentOrderList);
		mav.setViewName("orderManagement/orderList");

		return mav;
	}

	// ajax 실시간으로 주문정보 불러오기
	@RequestMapping(value = "/orderList.do", method = RequestMethod.POST)
	public void orderList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=UTF-8");

		OrderVO orderVO = service.selectAddOneOrder();

		if (orderVO != null) {
			JSONObject jsonOneOrder = new JSONObject();
			JSONArray jsonDetailOrderList = new JSONArray();

			jsonOneOrder.put("no", orderVO.getNo());
			jsonOneOrder.put("storeName", orderVO.getStoreName());
			jsonOneOrder.put("id", orderVO.getId());
			jsonOneOrder.put("order_price", orderVO.getOrder_price());
			jsonOneOrder.put("final_price", orderVO.getFinal_price());
			jsonOneOrder.put("eatType", orderVO.getEatType());
			jsonOneOrder.put("payment", orderVO.getPayment());
			jsonOneOrder.put("orderStatus", orderVO.getOrderStatus());
			jsonOneOrder.put("regDate", orderVO.getRegDate());

			String menu = orderVO.getMenu();
			String[] menus = menu.split("\\|\\|");

			for (int j = 0; j < menus.length; ++j) {
				JSONObject jsonDetailOrder = new JSONObject();
				DetailOrderVO vo = new DetailOrderVO();
				String[] oneMenu = menus[j].split("\\*");

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
			jsonOneOrder.put("detailOrderList", jsonDetailOrderList.toString());

			response.getWriter().print(jsonOneOrder.toString());
		} else {
			System.out.println("null");
			response.getWriter().print("null");
		}
	}

}
