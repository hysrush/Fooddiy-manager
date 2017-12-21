package kr.co.bit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.vo.QnaBoardVO;

@Repository
public class QnaDAOImp implements QnaDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String url = "kr.co.bit.dao.QnaDAO.";
	
	// <QnA DAO>
	// QnA 전체보기
	@Override
	public List<QnaBoardVO> selectAll() {
		List<QnaBoardVO> listAll = sqlSession.selectList(url + "selectAllQnA");
		return listAll;
	}
	// 글번호별 QnA 글보기
	@Override
	public QnaBoardVO selectOne(int no) {
		QnaBoardVO qnaDetail = sqlSession.selectOne(url + "selectOneQnA", no);
		return qnaDetail;
	}
	// QnA 새 글쓰기
	@Override
	public void insert(QnaBoardVO qnaVO) {
		sqlSession.insert(url + "insertQnA", qnaVO);
	}
	// QnA 글 수정
	@Override
	public void update(QnaBoardVO qnaVO) {
		sqlSession.update(url + "modifyQnA", qnaVO);
	}
	// QnA 글 삭제
	@Override
	public void delete(int no) {
		sqlSession.delete(url + "removeQnA", no);
	}
	// QnA 글 다중 삭제
	@Override
	public void deleteSome(List<Integer> list) {
		sqlSession.delete(url + "removeQnASome", list);
	}
	// 메인 화면에 QNA 목록
	@Override
	public List<QnaBoardVO> selectQnaMain() {
		return sqlSession.selectList("kr.co.bit.main.mainQ");
	}
	
}
