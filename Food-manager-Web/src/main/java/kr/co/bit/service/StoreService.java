package kr.co.bit.service;

import java.util.List;

import kr.co.bit.vo.PagingVO;
import kr.co.bit.vo.StoreVO;

public interface StoreService {

	
	

	List<StoreVO> storeList(PagingVO paging);
	int selectTotalPaging();
}
