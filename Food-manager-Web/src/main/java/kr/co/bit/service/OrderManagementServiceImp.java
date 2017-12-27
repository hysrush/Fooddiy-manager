package kr.co.bit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.dao.OrderManagementDAO;
import kr.co.bit.vo.ManagerVO;
import kr.co.bit.vo.OrderVO;

@Service
public class OrderManagementServiceImp  implements OrderManagementService{
	
	@Autowired
	OrderManagementDAO dao;
	
	@Override
	public List<OrderVO> selectAll(String branch) {
		List<OrderVO> allOrderList = dao.selectAll(branch);
		return allOrderList;
	}
	
	@Override
	public List<OrderVO> selectByDate(Map<String, String> date) {
		List<OrderVO> orderListDate = dao.selectByDate(date);
		
		return orderListDate;
	}
	
	@Override
	public List<OrderVO> selectByToday(Map<String, String> date) {
		List<OrderVO> orderListToday = dao.selectByToday(date);
		return orderListToday;
	}
	
	@Override
	public OrderVO selectByNo(Map<String, String> info) {
		
		OrderVO orderVO = dao.selectByNo(info);
		return orderVO;
	}
	
	@Override
	public List<OrderVO> selectByorderStatus(String branch) {
		List<OrderVO> orderList = dao.selectByOrderStatus(branch);
		return orderList;
	}
	
	@Override
	public OrderVO selectAddOneOrder(String branch) {
		OrderVO orderVO = dao.selectAddOneOrder(branch);
		return orderVO;
	}
	@Override
	public void cancelOrder(Map<String, String> info) {
		dao.cancelOrder(info);
	}
	
	@Override
	public void completeOrder(Map<String, String> info) {
		dao.completeOrder(info);
	}
	
	//메인 페이지 주문 건수
	@Override
	public int selectTodayMain(ManagerVO m) {
		return dao.selectTodayMain(m);
	}
	
	
}
