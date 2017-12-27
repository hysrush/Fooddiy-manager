package kr.co.bit.dao;

import java.util.List;
import java.util.Map;

import kr.co.bit.vo.ManagerVO;
import kr.co.bit.vo.OrderVO;

public interface OrderManagementDAO {
	public List<OrderVO> selectAll(String branch);
	public List<OrderVO> selectByDate(Map<String, String> date);
	public List<OrderVO> selectByToday(Map<String, String> date);
	public OrderVO selectByNo(Map<String, String> info);
	public List<OrderVO> selectByOrderStatus(String branch);
	public OrderVO selectAddOneOrder(String branch);
	public void cancelOrder(Map<String, String> info);
	public void completeOrder(Map<String, String> info);
	public int selectTodayMain(ManagerVO m);
}
