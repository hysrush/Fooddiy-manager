package kr.co.bit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.vo.MenuVO;

@Repository
public class MenuDAOImp implements MenuDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String url = "kr.co.bit.dao.MenuDAO.";
	
	// <Menu DAO>
	// 메뉴 전체보기
	public List<MenuVO> selectAll() {
		List<MenuVO> listAll = sqlSession.selectList(url + "selectAllMenu");
		return listAll;
	}
	//번호별 메뉴보기(상세보기)
	public MenuVO selectOne(int no) {
		MenuVO menuDetail = sqlSession.selectOne(url + "selectOneMenu", no);
		return menuDetail;
	}
	//새 메뉴 쓰기
	public void insert(MenuVO menuVO) {
		sqlSession.insert(url + "insertMenu", menuVO);		
	}
	//메뉴 수정
	public void update(MenuVO menuVO) {
		sqlSession.update(url + "modifyMenu", menuVO);				
	}
	//메뉴 삭제
	public void delete(int no) {
		sqlSession.delete(url + "removeMenu", no);
	}
	//메뉴 다중삭제
	public void deleteSome(List<Integer> list) {
		sqlSession.delete(url + "removeMenuSome", list);				
	}
	
}
