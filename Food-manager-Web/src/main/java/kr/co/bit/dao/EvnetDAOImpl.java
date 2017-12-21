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
public class EvnetDAOImpl implements EventDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String url = "kr.co.bit.dao.EventDAO.";
	
	@Override
	public List<EventBoardVO> selectAll(){
		
		List<EventBoardVO> list = sqlSession.selectList(url + "selectAllEvent");
		return list;
	}
	
	@Override
	public List<EventBoardVO> selectPaging(PagingVO paging){
		List<EventBoardVO> list = sqlSession.selectList(url + "selectPaging", paging);
		return list;
		
	}
	@Override 
	public int selectTotalPaging() {
		
		int Total =  sqlSession.selectOne(url + "selectTotalPaging");
		
		return Total;
	}
	
	
	@Override
	public List<EventBoardVO> selectEndEvent(PagingVO paging) {
		List<EventBoardVO> list = sqlSession.selectList(url +"selectEndEvent", paging);
		return list;
	}
	
	public List<EventBoardVO> selectEventBystoreName(String store){
		
		List<EventBoardVO> list = sqlSession.selectList(url + "selectEventBystoreName", store);
		return list;
	}
	
	
	@Override
	public EventBoardVO selectOne(int no) { 
		
		EventBoardVO eventDetail = sqlSession.selectOne(url + "selectByNo" , no);
		return eventDetail;
	}
	@Override
	public List<StoreVO> selectStoreList(String gugun){
		
		System.out.println("dao - gugun : " + gugun);
		List<StoreVO> list = sqlSession.selectList(url + "selectStore", gugun);
		
		return list;
	}
	
	@Override
	public void insert(EventBoardVO eventVO) { 
		sqlSession.insert(url + "insertEvent" , eventVO);
	}
	
	@Override
	public void update(EventBoardVO eventVO) {
		
		sqlSession.update(url+"updateEvent", eventVO);
	}
	
	@Override
	public void delete(int no) {
		sqlSession.delete(url +"deleteEvent", no);
		
	}

	@Override
	public List<CityVO> selectCity() {
		
		List<CityVO> list = sqlSession.selectList(url + "selectCity");
		
		return list;
	}

	@Override
	public List selectLocation(String sido) {
		System.out.println(sido);
		List list = sqlSession.selectList(url + "selectLocation",sido);
		
		return list;
	}

	@Override
	public String locationName(String gugun) {
		String locationName = sqlSession.selectOne(url + "locationName", gugun);
		return locationName;
	}

	@Override
	public List<StoreVO> searchStoreName(String search) {
		List<StoreVO> storenameList = sqlSession.selectList(url + "searchStoreName", search);
		
		// 검색된 데이터가 있으면 list 리턴, 없으면 null 리턴
		/*if (storenameList.size() >= 1) {
			System.out.println("데이터 있음");
			return storenameList;
		} else {
			System.out.println("데이터 없음");
			return null;
		}*/
		return storenameList;
	}

	@Override
	public List<EventBoardVO> selectEventMain() {
		return sqlSession.selectList("kr.co.bit.main.mainE");
	}

}
