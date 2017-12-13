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
	
	public List<OrderVO> selectByNo() {
		List<OrderVO> orderList = session.selectList(url + "selectByNo");
		return  orderList;
	}
	
	@Override
	public void cancelOrder(int no) {
		session.update(url + "cancelOrder", no);
	}
	
}
