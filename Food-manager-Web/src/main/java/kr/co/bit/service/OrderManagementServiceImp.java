package kr.co.bit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.dao.OrderManagementDAO;
import kr.co.bit.vo.OrderVO;

@Service
public class OrderManagementServiceImp  implements OrderManagementService{
	
	@Autowired
	OrderManagementDAO dao;
	
	
	@Override
	public List<OrderVO> selectAll() {
		List<OrderVO> allOrderList = dao.selectAll();
		return allOrderList;
	}
	
	@Override
	public List<OrderVO> selectByToday(String today) {
		List<OrderVO> orderListToday = dao.selectByToday(today);
		return orderListToday;
	}
	
	@Override
	public OrderVO selectByNo(int no) {
		
		OrderVO orderVO = dao.selectByNo(no);
		return orderVO;
	}
	
	@Override
	public List<OrderVO> selectByorderStatus() {
		List<OrderVO> orderList = dao.selectByOrderStatus();
		return orderList;
	}
	
	@Override
	public OrderVO selectAddOneOrder() {
		OrderVO orderVO = dao.selectAddOneOrder();
		return orderVO;
	}
	@Override
	public void cancelOrder(int no) {
		dao.cancelOrder(no);
	}
	
	@Override
	public void completeOrder(int no) {
		dao.completeOrder(no);
	}
	
	
}
