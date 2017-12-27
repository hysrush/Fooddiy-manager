package kr.co.bit.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.dao.ClaimDAO;
import kr.co.bit.vo.ClaimBoardVO;

@Service
public class ClaimServiceImp implements ClaimService {
	
	@Autowired
	private ClaimDAO claimDAO;

	// <Claim Service>
	// Claim 전체보기
	@Override
	public List<ClaimBoardVO> selectAllClaim() {
		List<ClaimBoardVO> listAll = claimDAO.selectAll();
		return listAll;
	}
	// 글번호별 Claim 글보기
	@Override
	public ClaimBoardVO selectOneClaim(int no) {
		ClaimBoardVO claimDetail = claimDAO.selectOne(no);
		return claimDetail;
	}
	// Claim 새 글쓰기
	@Override
	public void insertClaim(ClaimBoardVO claimVO) {
		claimDAO.insert(claimVO);
	}
	// Claim 글 수정
	@Override
	public void modifyClaim(ClaimBoardVO claimVO) {
		claimDAO.update(claimVO);
	}
	// Claim fileOX : O - 파일있음
	@Override
	public void updateFileOX_O(int no) {
		claimDAO.FileOX_O(no);
	}
	// Claim fileOX : X - 파일없음
	@Override
	public void updateFileOX_X(int no) {
		claimDAO.FileOX_X(no);
	}
	// Claim 글 삭제
	@Override
	public void removeClaim(int no) {
		claimDAO.delete(no);
	}
	// Claim 글 다중 삭제
	@Override
	public void removeClaimSome(List<Integer> list) {
		claimDAO.deleteSome(list);
	}
	// Claim 조회수 증가
	@Override
	public void updateViewcntClaim(int no, HttpSession session) {
		
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
        	claimDAO.addViewcnt(no);
            // 세션에 시간을 저장 : "update_time_"+ no는 다른변수와 중복되지 않게 명명한 것
            session.setAttribute("update_time_" + no, current_time);
        }
	}
	
	// id에 맞는 문의사항 목록 가져오기
	@Override
	public List<ClaimBoardVO> selectClaim(String id) {

		List<ClaimBoardVO> list = claimDAO.selectClaim(id);
		
		return list;
	}
}
