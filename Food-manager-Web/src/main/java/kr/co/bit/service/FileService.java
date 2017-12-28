package kr.co.bit.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.vo.FileVO;


public interface FileService {
	
	// File Service
	String uploadFile(HttpServletRequest request, int boardNo);
	void downloadFile(HttpServletResponse response, int no) throws Exception;
	String modifyFile(HttpServletRequest request, int boardNo);
	FileVO selectOneFile(int no);
	List<FileVO> selectFileList(Map<String, Object> fileMap);
	void removeFile(int no);
	void removeFileSome(List<Integer> list);
	void deleteFile(int no);
	void deleteFile(String filePath);
}
