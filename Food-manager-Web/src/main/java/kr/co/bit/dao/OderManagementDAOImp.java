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
		
		
		System.out.println("업데이트 전");
		//주문 상태업데이트
		session.update(url + "updateOrderStatus"); 
		
/*		
		String test1 = session.selectOne(url + "test");
		String test2 = session.selectOne(url + "test2");
		System.out.println(test1);
		System.out.println(test2);*/
		
		System.out.println("업데이트 후");
		
		return orderList;
	}
	@Override
	public void cancelOrder(int no) {
		session.update(url + "cancelOrder", no);
	}
	
}
