package kr.co.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.bit.vo.FileVO;


public interface FileService {
	
	// File Service
	String save(HttpServletRequest request, int boardNo);
	String modifyFile(HttpServletRequest request, int boardNo);
	FileVO selectOneFile(int boardNo);
	void removeFile(int no);
	void removeFileSome(List<Integer> list);
}
