package kr.co.bit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.vo.CityVO;
import kr.co.bit.vo.EventBoardVO;
import kr.co.bit.vo.PagingVO;
import kr.co.bit.vo.StoreVO;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String url = "kr.co.bit.dao.StoreDAO.";
	
	
	
	@Override
	public List<StoreVO> storeList() {
		
		List<StoreVO> list = sqlSession.selectList(url + "selectStoreAll");
		return list;
	}
	
	@Override
	public void update(StoreVO storeVO) {
		
		sqlSession.update(url+"updateStore", storeVO);
		System.out.println("sql이 안되는거지 ?");
	}
	
	@Override
	public void delete(int no) {
		sqlSession.delete(url +"deleteStore", no);
		
	}

	@Override
	public StoreVO selectOne(int no) {
		StoreVO storeOne = sqlSession.selectOne(url + "selectByNo" , no);
		return storeOne;
	}

	@Override
	public List<CityVO> selectCity() {
		List<CityVO> list = sqlSession.selectList(url+"selectCity");

		return list;
	}

	@Override
	public List selectLocation(String sido) {
		List list = sqlSession.selectList(url +"selectLocation", sido);
		return list;
	}

	@Override
	public void insert(StoreVO storeVO) {
		sqlSession.insert(url + "insertStore", storeVO);
		
	}
	
	
}
