package kr.co.bit.dao;

import java.util.List;

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
	public FileVO selectOne(int boardNo) {
		FileVO fileDetail = sqlSession.selectOne(url + "selectOneFile", boardNo);
		return fileDetail;
	}
	// File 수정
	@Override
	public void update(FileVO fileVO) {
		sqlSession.update(url + "modifyFile", fileVO);
	}
	// File 삭제
	@Override
	public void delete(int no) {
		sqlSession.delete(url + "removeFile", no);
	}
	// File 다중 삭제
	@Override
	public void deleteSome(List<Integer> list) {
		sqlSession.delete(url + "removeFileSome", list);
	}
	
}
