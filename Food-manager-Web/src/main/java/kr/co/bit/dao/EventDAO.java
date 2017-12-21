package kr.co.bit.dao;

import java.util.List;

import kr.co.bit.vo.CityVO;
import kr.co.bit.vo.EventBoardVO;
import kr.co.bit.vo.PagingVO;
import kr.co.bit.vo.StoreVO;

public interface EventDAO {
	
	List<EventBoardVO> selectAll();
	List<EventBoardVO> selectEndEvent(PagingVO paging);
	List<EventBoardVO> selectPaging(PagingVO paging);
	int selectTotalPaging();
	
	List<EventBoardVO> selectEventBystoreName(String store);
	
	List<StoreVO> selectStoreList(String gugun);
	List<StoreVO> searchStoreName(String search);
	
	List<CityVO> selectCity();
	List selectLocation(String sido);
	EventBoardVO selectOne(int no);
	void insert(EventBoardVO eventVO);
	void update(EventBoardVO eventVO);
	void delete(int no);
	
	String locationName(String gugun);
	List<EventBoardVO> selectEventMain();
	
}
