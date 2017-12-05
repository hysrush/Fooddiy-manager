package kr.co.bit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.dao.EventDAO;
import kr.co.bit.vo.CityVO;
import kr.co.bit.vo.EventBoardVO;
import kr.co.bit.vo.PagingVO;
import kr.co.bit.vo.StoreVO;

@Service
public class EventServiceImpl implements EventService{

	@Autowired
	private EventDAO eventDAO;
	
	@Override
	public List<EventBoardVO> selectAllEvent(){
		List<EventBoardVO> list = eventDAO.selectAll();
		return list;
	}
	
	@Override
	public List<EventBoardVO> selectPaging(PagingVO paging){
		List<EventBoardVO> list = eventDAO.selectPaging(paging);
		return list;
	}
	@Override
	public int selectTotalPaging() {
		int total = eventDAO.selectTotalPaging();
		
		return total;
	}
	

	@Override
	public List<EventBoardVO> selectEndEvent(PagingVO paging) {
		List<EventBoardVO> list = eventDAO.selectEndEvent(paging);
		return list;
	}
	
	@Override
	public List<EventBoardVO> selectEventBystoreName(String store){
		List<EventBoardVO> list = eventDAO.selectEventBystoreName(store);
		return list;
	}
	
	@Override
	public List<StoreVO> selectStoreList(String gugun){
		List<StoreVO> list = eventDAO.selectStoreList(gugun);
		return list;
	}
	
	//Event 湲� 蹂닿린
	@Override
	public EventBoardVO selectOneEvent(int no) {
		return eventDAO.selectOne(no);
	}
	
	//Event 湲��벐湲�
	@Override
	public void insertEvent(EventBoardVO eventVO) {
		eventDAO.insert(eventVO);
	}
	
	@Override
	public void modifyEvent(EventBoardVO eventVO) {
		eventDAO.update(eventVO);
	}
	
	@Override
	public void removeEvent(int no) {
		eventDAO.delete(no);
	}

	@Override
	public List<CityVO> selectCity() {
		List<CityVO> list = eventDAO.selectCity();
		return list;
	}

	@Override
	public List selectLocation(String sido) {
		List list = eventDAO.selectLocation(sido);
		return list;
	}

	@Override
	public String locationName(String gugun) {
		String locationName = eventDAO.locationName(gugun);
		return locationName;
	}

	@Override
	public List<StoreVO> searchStoreName(String search) {
		List<StoreVO> storenameList = eventDAO.searchStoreName(search);
		return storenameList;
	}
	
}
