package kr.co.bit.dao;

import java.util.List;

import kr.co.bit.vo.OrderVO;

public interface OrderManagementDAO {
	public List<OrderVO> selectAll();
	public List<OrderVO> selectByToday(String today);
	public OrderVO selectByNo(int no);
	public List<OrderVO> selectByOrderStatus();
	public OrderVO selectAddOneOrder();
	public void cancelOrder(int no);
	public void completeOrder(int no);
}
