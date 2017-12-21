package kr.co.bit.dao;

import java.util.List;

import kr.co.bit.vo.FileVO;
import kr.co.bit.vo.NoticeBoardVO;

public interface FileDAO {
	
	// File DAO
	void insert(FileVO fileVO);
	FileVO selectOne(int boardNo);
	void update(FileVO fileVO);
	void delete(int no);
	void deleteSome(List<Integer> list);
}
