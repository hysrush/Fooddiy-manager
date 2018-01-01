package kr.co.bit.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.dao.QnaDAO;
import kr.co.bit.vo.QnaBoardVO;

@Service
public class QnaServiceImp implements QnaService {

	@Autowired
	private QnaDAO qnaDAO;
	
	// <QnA Service>
	// QnA 전체보기
	@Override
	public List<QnaBoardVO> selectAllQnA() {
		List<QnaBoardVO> listAll = qnaDAO.selectAll();
		return listAll;
	}
	// 글번호별 QnA 글보기
	@Override
	public QnaBoardVO selectOneQnA(int no) {
		QnaBoardVO qnaDetail = qnaDAO.selectOne(no);
		return qnaDetail;
	}
	// QnA 새 글쓰기
	@Override
	public void insertQnA(QnaBoardVO qnaVO) {
		qnaDAO.insert(qnaVO);
	}
	// QnA 글 수정
	@Override
	public void modifyQnA(QnaBoardVO qnaVO) {
		qnaDAO.update(qnaVO);
	}
	// QnA 글 삭제
	@Override
	public void removeQnA(int no) {
		qnaDAO.delete(no);
	}
	// QnA 글 다중 삭제
	@Override
	public void removeQnASome(List<Integer> list) {
		qnaDAO.deleteSome(list);
	}
	// 메인 화면에 QNA
	@Override
	public List<QnaBoardVO> selectQnaMain() {
		
		return qnaDAO.selectQnaMain();
	}
}
