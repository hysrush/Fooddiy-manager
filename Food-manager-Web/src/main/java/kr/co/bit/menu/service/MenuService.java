package kr.co.bit.menu.service;

import java.util.List;

import kr.co.bit.menu.vo.MenuVO;

public interface MenuService {
	
	List<MenuVO> selectAllMenu();
	MenuVO selectOneMenu(int no);
	void insertMenu(MenuVO menu);
	void modifyMenu(MenuVO menu);
	void removeMenu(int no);
	
}