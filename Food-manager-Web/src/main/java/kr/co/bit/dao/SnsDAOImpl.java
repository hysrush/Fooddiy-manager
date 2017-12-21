package kr.co.bit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.vo.PagingVO;
import kr.co.bit.vo.SnsBoardVO;

@Repository
public class SnsDAOImpl implements SnsDAO {

	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	private String url = "kr.co.bit.dao.SnsDAO.";
	
	
	@Override
	public List<SnsBoardVO> selectSns(PagingVO paging) {
		List<SnsBoardVO> list = sqlSession.selectList(url + "selectSns",paging);
		
		return list;
	}
	@Override
	public SnsBoardVO selectOne(int no) { 
		
		SnsBoardVO snsDetail = sqlSession.selectOne(url + "selectByNo" , no);
		return snsDetail;
	}
	
	@Override
	public void delete(int no) {
		sqlSession.delete(url + "deleteSns", no);
		
	}
}
