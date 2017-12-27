package kr.co.bit.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.vo.ManagerVO;
import kr.co.bit.vo.OrderVO;

@Repository
public class OderManagementDAOImp  implements OrderManagementDAO{

	
	@Autowired
	private SqlSessionTemplate session;
	private String url = "kr.co.bit.dao.OrderManagementDAO.";
	
	
	public List<OrderVO> selectAll(String branch) {
		
		List<OrderVO> allOrderList = session.selectList(url + "selectAllOrder", branch);
		return allOrderList;
	}
	@Override
	public List<OrderVO> selectByDate(Map<String, String> date) {

		List<OrderVO> orderListDate = session.selectList(url + "selectByDate", date);
		return orderListDate;
	}
	public List<OrderVO> selectByToday(Map<String, String> date) {
		List<OrderVO> orderListToday = session.selectList(url + "selectByToday", date);
		return orderListToday;
	}
	
	public OrderVO selectByNo(Map<String, String> info) {
		OrderVO orderList = session.selectOne(url + "selectByNo", info);
		return  orderList;
	}
	@Override
	public List<OrderVO> selectByOrderStatus(String branch) {
		
		//주문검색 - 대기중이거나 준비중인 상품 검색
		List<OrderVO> orderList = session.selectList(url + "selectByOrderStatus", branch);
		
		//주문 상태업데이트
		session.update(url + "updateOrderStatus", branch); 
		
		return orderList;
	}
	@Override
	public OrderVO selectAddOneOrder(String branch) {
		OrderVO orderVO = session.selectOne(url + "selectAddOneOrder", branch);
		session.update(url + "updateAddOneOrderSataus", branch);
		return orderVO;
	}
	@Override
	public void cancelOrder(Map<String, String> info) {
		session.update(url + "cancelOrder", info);
	}
	@Override
	public void completeOrder(Map<String, String> info) {
		session.update(url + "completeOrder", info);
	}
	//메인 페이지 주문 건수
	@Override
	public int selectTodayMain(ManagerVO m) {
		return session.selectOne("kr.co.bit.main.mainC", m);
	}
}
