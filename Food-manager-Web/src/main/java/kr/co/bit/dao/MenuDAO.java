package kr.co.bit.dao;

import java.util.List;
import kr.co.bit.vo.MenuVO;

public interface MenuDAO {
	
	List<MenuVO> selectAll();
	MenuVO selectOne(int no);
	void insert(MenuVO menuVO);
	void update(MenuVO menuVO);
	void delete(int no);
	void deleteSome(List<Integer> list);	
	
	// 05. 게시글 전체 목록
	public List<MenuVO> listAll(int start, int end) throws Exception;
	// 07. 게시글 레코드 갯수 메서드 추가
	public int countArticle() throws Exception;
}