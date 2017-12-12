package kr.co.bit.dao;

import java.util.List;

import kr.co.bit.vo.CityVO;
import kr.co.bit.vo.StoreVO;

public interface StoreDAO {

	
	List<StoreVO> storeList();
	StoreVO selectOne(int no);
	void update(StoreVO storeVO);
	void delete(int no);
	List<CityVO> selectCity();
	List selectLocation(String sido);
	
	
	
	
}
