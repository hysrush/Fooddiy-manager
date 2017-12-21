package kr.co.bit.dao;

import java.util.List;

import kr.co.bit.vo.QnaBoardVO;

public interface QnaDAO {
	
	// QnA DAO
	List<QnaBoardVO> selectAll();
	QnaBoardVO selectOne(int no);
	void insert(QnaBoardVO qnaVO);
	void update(QnaBoardVO qnaVO);
	void delete(int no);
	void deleteSome(List<Integer> list);
	List<QnaBoardVO> selectQnaMain(String name);
}
