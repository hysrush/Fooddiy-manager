package kr.co.bit.menu.dao;

import java.util.List;
import kr.co.bit.menu.vo.MenuVO;

public interface MenuDAO {
	
	List<MenuVO> selectAll();
	MenuVO selectOne(int no);
	void insert(MenuVO menuVO);
	void update(MenuVO menuVO);
	void delete(int no);
	
}