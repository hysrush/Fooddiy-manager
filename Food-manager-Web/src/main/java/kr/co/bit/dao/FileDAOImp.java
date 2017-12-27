package kr.co.bit.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.vo.FileVO;

@Repository
public class FileDAOImp implements FileDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String url = "kr.co.bit.dao.FileDAO.";
	
	// <File DAO>
	// File 저장
	@Override
	public void insert(FileVO fileVO) {
		sqlSession.insert(url + "insertFile", fileVO);
	}
	// File 보기
	@Override
	public FileVO selectOne(Map<String, Object> fileMap) {
		FileVO fileDetail = sqlSession.selectOne(url + "selectOneFile", fileMap);
		return fileDetail;
	}
	// File 수정
	@Override
	public void update(FileVO fileVO) {
		sqlSession.update(url + "modifyFile", fileVO);
	}
	// File 삭제
	@Override
	public void delete(Map<String, Object> fileMap) {
		sqlSession.delete(url + "removeFile", fileMap);
	}
	// File 다중 삭제
	@Override
	public void deleteSome(List<Integer> list) {
		sqlSession.delete(url + "removeFileSome", list);
	}
	
}
