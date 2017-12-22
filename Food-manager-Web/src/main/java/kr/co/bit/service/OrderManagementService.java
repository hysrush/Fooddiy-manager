package kr.co.bit.service;

import java.util.List;
import java.util.Map;

import kr.co.bit.vo.ManagerVO;
import kr.co.bit.vo.OrderVO;

public interface OrderManagementService {
	public List<OrderVO> selectAll();
	public List<OrderVO> selectByDate(Map<String, String> date);
	public List<OrderVO> selectByToday(String today);
	public OrderVO selectByNo(int no);
	public List<OrderVO> selectByorderStatus();
	public OrderVO selectAddOneOrder();
	public void cancelOrder(int no);
	public void completeOrder(int no);
	public int selectTodayMain(ManagerVO m);
}
