package kr.co.bit.service;

import java.util.List;

import kr.co.bit.vo.CityVO;
import kr.co.bit.vo.StoreVO;

public interface StoreService {

	
	

	List<StoreVO> storeList();
	StoreVO selectOne(int no);
	void update(StoreVO storeVO);
	void delete(int no);
	void insert(StoreVO storeVO);
	List<CityVO> selectCity();
	List selectLocation(String sido);
	
}
