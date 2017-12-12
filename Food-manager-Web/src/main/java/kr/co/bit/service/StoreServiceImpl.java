package kr.co.bit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.dao.StoreDAO;
import kr.co.bit.vo.CityVO;
import kr.co.bit.vo.PagingVO;
import kr.co.bit.vo.StoreVO;
@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreDAO storeDAO;
	
	
	
	@Override
	public List<StoreVO> storeList() {
		List<StoreVO> list = storeDAO.storeList();
		return list;
	}



	@Override
	public void update(StoreVO storeVO) {
		storeDAO.update(storeVO);
		
	}



	@Override
	public void delete(int no) {
		storeDAO.delete(no);
		
	}



	@Override
	public StoreVO selectOne(int no) {
		return storeDAO.selectOne(no);
	}



	@Override
	public List<CityVO> selectCity() {
		List<CityVO> list = storeDAO.selectCity();
		return list;
	}



	@Override
	public List selectLocation(String sido) {
		List list = storeDAO.selectLocation(sido);
		
		return list;
	}



	
	
	
	
	
	
	
	

}
