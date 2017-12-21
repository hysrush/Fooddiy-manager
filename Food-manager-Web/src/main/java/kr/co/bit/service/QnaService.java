package kr.co.bit.service;

import java.util.List;


import kr.co.bit.vo.QnaBoardVO;


public interface QnaService {

	// QnA Service
	List<QnaBoardVO> selectAllQnA();
	QnaBoardVO selectOneQnA(int no);
	void insertQnA(QnaBoardVO qnaVO);
	void modifyQnA(QnaBoardVO qnaVO);
	void removeQnA(int no);
	void removeQnASome(List<Integer> list);
	List<QnaBoardVO> selectQnaMain();
}
