package kr.co.bit.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.vo.FileVO;


public interface FileService {
	
	// File Service
	String uploadFile(HttpServletRequest request, int boardNo);
	void downloadFile(HttpServletResponse response, Map<String, Object> fileMap) throws Exception;
	String modifyFile(HttpServletRequest request, int boardNo);
	FileVO selectOneFile(Map<String, Object> fileMap);
	void removeFile(Map<String, Object> fileMap);
	void removeFileSome(List<Integer> list);
	void deleteFile(Map<String, Object> fileMap);
	void deleteFile(String filePath);
}
