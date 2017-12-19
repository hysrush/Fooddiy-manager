package kr.co.bit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.dao.MenuDAO;
import kr.co.bit.vo.MenuVO;

@Service
public class MenuServiceImp implements MenuService {	
	
	@Autowired
	private MenuDAO menuDAO;
	
	// <Menu Service>
	// Menu 전체보기
	public List<MenuVO> selectAllMenu() {
		List<MenuVO> listAll = menuDAO.selectAll();
		return listAll;
	}
	// 번호별 menu보기(상세보기)
	public MenuVO selectOneMenu(int no) {
		MenuVO menuDetail = menuDAO.selectOne(no);
		return menuDetail;
	}
	// Menu 새 글쓰기
	public void insertMenu(MenuVO menuVO) {
		menuDAO.insert(menuVO);
	}	
	// Menu 글 수정
	public void modifyMenu(MenuVO menuVO) {
		menuDAO.update(menuVO);		
	}
	// Menu 글 삭제
	public void removeMenu(int no) {
		menuDAO.delete(no);
	}
	// Menu 다중 삭제
	public void removeMenuSome(List<Integer> list) {
		menuDAO.deleteSome(list);
	}
	
	
	
	// 05. 게시글 전체 목록
	@Override
	public List<MenuVO> listAll(int start, int end) throws Exception {
		return menuDAO.listAll(start, end);
	}
	// 07. 게시글 레코드 갯수 boardDao.countArticle메서드
	@Override
	public int countArticle() throws Exception {
		return menuDAO.countArticle();
	}    
    
}
