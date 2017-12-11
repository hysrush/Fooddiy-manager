package kr.co.bit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.dao.StoreDAO;
import kr.co.bit.vo.PagingVO;
import kr.co.bit.vo.StoreVO;
@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreDAO storeDAO;
	
	
	
	@Override
	public List<StoreVO> storeList(PagingVO paging) {
		List<StoreVO> list = storeDAO.storeList(paging);
		return list;
	}



	@Override
	public int selectTotalPaging() {
		int total = storeDAO.selectTotalPaging();
		
		return total;
	}
	
	
	
	
	
	
	
	
	
	

}
