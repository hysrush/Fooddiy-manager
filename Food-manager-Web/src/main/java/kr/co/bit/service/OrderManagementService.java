package kr.co.bit.service;

import java.util.List;

import kr.co.bit.vo.OrderVO;

public interface OrderManagementService {
	public List<OrderVO> selectAll();
	public List<OrderVO> selectByToday(String today);
	public List<OrderVO> selectByNo();
	public void cancelOrder(int no);
}
