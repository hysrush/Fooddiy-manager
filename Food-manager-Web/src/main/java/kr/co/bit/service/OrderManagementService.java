package kr.co.bit.service;

import java.util.List;

import kr.co.bit.vo.OrderVO;

public interface OrderManagementService {
	public List<OrderVO> selectAll();
	public List<OrderVO> selectByToday();
	public List<OrderVO> selectByNo();
}
