package kr.co.bit.service;

import java.util.List;

import kr.co.bit.vo.MenuVO;

public interface MenuService {
	
	List<MenuVO> selectAllMenu();
	MenuVO selectOneMenu(int no);
	void insertMenu(MenuVO menu);
	void modifyMenu(MenuVO menu);
	void removeMenu(int no);
	void removeMenuSome(List<Integer> list);
	
}