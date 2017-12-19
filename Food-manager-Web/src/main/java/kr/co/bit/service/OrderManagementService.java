package kr.co.bit.service;

import java.util.List;

import kr.co.bit.vo.OrderVO;

public interface OrderManagementService {
	public List<OrderVO> selectAll();
	public List<OrderVO> selectByToday(String today);
	public OrderVO selectByNo(int no);
	public List<OrderVO> selectByorderStatus();
	public OrderVO selectAddOneOrder();
	public void cancelOrder(int no);
	public void completeOrder(int no);
}
