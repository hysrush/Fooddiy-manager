package kr.co.bit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.vo.PagingVO;
import kr.co.bit.vo.StoreVO;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String url = "kr.co.bit.dao.storeDAO.";
	
	
	
	@Override
	public List<StoreVO> storeList(PagingVO paging) {
		
		List<StoreVO> list = sqlSession.selectList(url + "selectStoreAll", paging);
		return list;
	}
	
	
	@Override 
	public int selectTotalPaging() {
		
		int Total =  sqlSession.selectOne(url + "selectTotalPaging");
		
		return Total;
	}
	
	
}
