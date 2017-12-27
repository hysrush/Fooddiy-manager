package kr.co.bit.service;

import java.util.List;
import java.util.Map;

import kr.co.bit.vo.ManagerVO;
import kr.co.bit.vo.OrderVO;

public interface OrderManagementService {
	public List<OrderVO> selectAll(String branch);
	public List<OrderVO> selectByDate(Map<String, String> date);
	public List<OrderVO> selectByToday(Map<String, String> date);
	public OrderVO selectByNo(Map<String, String> info);
	public List<OrderVO> selectByorderStatus(String branch);
	public OrderVO selectAddOneOrder(String branch);
	public void cancelOrder(Map<String, String> info);
	public void completeOrder(Map<String, String> info);
	public int selectTodayMain(ManagerVO m);
}
