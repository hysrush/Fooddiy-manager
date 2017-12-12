package kr.co.bit.dao;

import java.util.List;

import kr.co.bit.vo.OrderVO;

public interface OrderManagementDAO {
	public List<OrderVO> selectAll();
	public List<OrderVO> selectByToday();
	public List<OrderVO> selectByNo();
}
