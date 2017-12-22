package kr.co.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.vo.FileVO;


public interface FileService {
	
	// File Service
	String uploadFile(HttpServletRequest request, int boardNo);
	void downloadFile(HttpServletResponse response, int boardNo) throws Exception;
	String modifyFile(HttpServletRequest request, int boardNo);
	FileVO selectOneFile(int boardNo);
	void removeFile(int no);
	void removeFileSome(List<Integer> list);
	void deleteFile(int no);
	void deleteFile(String filePath);
}
