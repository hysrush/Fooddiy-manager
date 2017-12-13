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
	
}