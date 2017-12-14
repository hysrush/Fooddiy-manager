package kr.co.bit.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.dao.NoticeDAO;
import kr.co.bit.vo.NoticeBoardVO;

@Service
public class NoticeServiceImp implements NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	// <Notice Service>
	// Notice 전체보기
	@Override
	public List<NoticeBoardVO> selectAllNotice() {
		List<NoticeBoardVO> listAll = noticeDAO.selectAll();
		return listAll;
	}
	// 타입별 Notice 전체보기
	@Override
	public List<NoticeBoardVO> selectType(String type) {
		List<NoticeBoardVO> listType = noticeDAO.selectAll();
		return listType;
	}
	// 글번호별 Notice 글보기
	@Override
	public NoticeBoardVO selectOneNotice(int no) {
		NoticeBoardVO noticeDetail = noticeDAO.selectOne(no);
		return noticeDetail;
	}
	// Notice 새 글쓰기
	@Override
	public void insertNotice(NoticeBoardVO noticeVO) {
		noticeDAO.insert(noticeVO);
	}
	// Notice 글 수정
	@Override
	public void modifyNotice(NoticeBoardVO noticeVO) {
		noticeDAO.update(noticeVO);
	}
	// Notice 글 삭제
	@Override
	public void removeNotice(int no) {
		noticeDAO.delete(no);
	}
	// Notice 조회수 증가
	@Override
	public void updateViewcntNotice(int no, HttpSession session) {
		
		long update_time = 0;
        // 세션에 저장된 조회시간 검색
        // 최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행X
        if(session.getAttribute("update_time_" + no) != null){
                                // 세션에서 읽어오기
            update_time = (long)session.getAttribute("update_time_" + no);
        }
        // 시스템의 현재시간을 current_time에 저장
        long current_time = System.currentTimeMillis();
        // 일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
        // 시스템현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
        if(current_time - update_time > 5*1000){
        	noticeDAO.addViewcnt(no);
            // 세션에 시간을 저장 : "update_time_"+ no는 다른변수와 중복되지 않게 명명한 것
            session.setAttribute("update_time_" + no, current_time);
            
        }
	}
}
