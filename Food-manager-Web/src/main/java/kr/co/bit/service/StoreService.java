package kr.co.bit.service;

import java.util.List;

import kr.co.bit.vo.CityVO;
import kr.co.bit.vo.StoreVO;
import kr.co.bit.vo.locationVO;

public interface StoreService {

	
	

	List<StoreVO> storeList();
	StoreVO selectOne(int no);
	void update(StoreVO storeVO);
	void delete(int no);
	void insert(StoreVO storeVO);
	List<CityVO> selectCity();
	List<locationVO> selectLocation(String sido);
	StoreVO selectStoreAddr(String store);
	
}
