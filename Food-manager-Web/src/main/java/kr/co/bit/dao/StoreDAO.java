package kr.co.bit.dao;

import java.util.List;

import kr.co.bit.vo.PagingVO;
import kr.co.bit.vo.StoreVO;

public interface StoreDAO {

	
	List<StoreVO> storeList(PagingVO paging);
	int selectTotalPaging();
	
	
	
	
	
	
}
