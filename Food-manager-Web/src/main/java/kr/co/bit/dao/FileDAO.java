package kr.co.bit.dao;

import java.util.List;
import java.util.Map;

import kr.co.bit.vo.FileVO;

public interface FileDAO {
	
	// File DAO
	void insert(FileVO fileVO);
	FileVO selectOne(int no);
	List<FileVO> selectList(Map<String, Object> fileMap);
	void update(FileVO fileVO);
	void delete(int no);
	void deleteSome(List<Integer> list);
}
