package kr.co.bit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.vo.OrderVO;

@Repository
public class OderManagementDAOImp  implements OrderManagementDAO{

	
	@Autowired
	private SqlSessionTemplate session;
	private String url = "kr.co.bit.dao.OrderManagementDAO.";
	
	
	public List<OrderVO> selectAll() {
		
		List<OrderVO> allOrderList = session.selectList(url + "selectAllOrder");
		return allOrderList;
	}
	
	public List<OrderVO> selectByToday(String today) {
		List<OrderVO> orderListToday = session.selectList(url + "selectByToday", today);
		return orderListToday;
	}
	
	public OrderVO selectByNo(int no) {
		OrderVO orderList = session.selectOne(url + "selectByNo", no);
		return  orderList;
	}
	@Override
	public List<OrderVO> selectByOrderStatus() {
		
		//주문검색 - 대기중이거나 준비중인 상품 검색
		List<OrderVO> orderList = session.selectList(url + "selectByOrderStatus");
		
		//주문 상태업데이트
		session.update(url + "updateOrderStatus"); 
		
		return orderList;
	}
	
	@Override
	public OrderVO selectAddOneOrder() {
		OrderVO orderVO = session.selectOne(url + "selectAddOneOrder");
		session.update(url + "updateAddOneOrderSataus");
		return orderVO;
	}
	@Override
	public void cancelOrder(int no) {
		session.update(url + "cancelOrder", no);
	}
	
	@Override
	public void completeOrder(int no) {
		session.update(url + "completeOrder", no);
	}
}
