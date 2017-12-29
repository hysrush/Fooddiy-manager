package kr.co.bit.dao;

import java.util.HashMap;
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
	// File 보기 (파일번호)
	@Override
	public FileVO selectOne(int no) {
		FileVO fileDetail = sqlSession.selectOne(url + "selectOneFile", no);
		return fileDetail;
	}
	// File 리스트 보기
	@Override
	public List<FileVO> selectList(int boardNo, String name) {
		// Mybatis에 매개변수 2개를 보내기 위해 map 생성
		Map<String, Object> fileMap = new HashMap<>();
		fileMap.put("boardNo", boardNo);
		fileMap.put("name", name);
		
		List<FileVO> fileList = sqlSession.selectList(url +"selectFileList", fileMap);
		return fileList;
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
