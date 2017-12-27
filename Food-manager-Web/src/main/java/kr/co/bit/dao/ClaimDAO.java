package kr.co.bit.dao;

import java.util.List;

import kr.co.bit.vo.ClaimBoardVO;


public interface ClaimDAO {
	
	// Claim DAO
	List<ClaimBoardVO> selectAll();
	ClaimBoardVO selectOne(int no);
	void insert(ClaimBoardVO claimVO);
	void update(ClaimBoardVO claimVO);
	void FileOX_O(int no);
	void FileOX_X(int no);
	void delete(int no);
	void deleteSome(List<Integer> list);
	void addViewcnt(int no);
	List<ClaimBoardVO> selectClaim(String id);
}
