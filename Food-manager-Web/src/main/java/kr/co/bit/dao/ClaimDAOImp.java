package kr.co.bit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.vo.ClaimBoardVO;

@Repository
public class ClaimDAOImp implements ClaimDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String url = "kr.co.bit.community.dao.ClaimDAO.";

	// <Claim DAO>
	// Claim 전체보기
	@Override
	public List<ClaimBoardVO> selectAll() {
		List<ClaimBoardVO> listAll = sqlSession.selectList(url + "selectAllClaim");
		return listAll;
	}
	// 글번호별 Claim 글보기
	@Override
	public ClaimBoardVO selectOne(int no) {
		ClaimBoardVO claimDetail = sqlSession.selectOne(url + "selectOneClaim", no);
		return claimDetail;
	}
	// Claim 새 글쓰기
	@Override
	public void insert(ClaimBoardVO claimVO) {
		sqlSession.insert(url + "insertClaim", claimVO);
	}
	// Claim 글 수정
	@Override
	public void update(ClaimBoardVO claimVO) {
		sqlSession.update(url + "modifyClaim", claimVO);
	}
	// Claim 글 삭제
	@Override
	public void delete(int no) {
		sqlSession.delete(url + "removeClaim", no);
	}
	// Claim 조회수 증가
	@Override
	public void addViewcnt(int no) {
		sqlSession.update(url + "updateViewcntClaim", no);
	}
	
	@Override
	public List<ClaimBoardVO> selectClaim(String id) {
		
		return sqlSession.selectList(url + "selectClaim", id);
	}
}
