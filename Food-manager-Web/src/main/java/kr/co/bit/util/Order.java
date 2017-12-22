package kr.co.bit.util;

import java.util.LinkedList;
import java.util.List;

import kr.co.bit.vo.DetailOrderVO;
import kr.co.bit.vo.OrderVO;

public class Order {
	public static List<OrderVO> splitDetailOrderList(List<OrderVO> orderList) {
		for (int i = 0; i < orderList.size(); ++i) {
			List<DetailOrderVO> list = new LinkedList<DetailOrderVO>();
			String menu = orderList.get(i).getMenu();
			String[] menus = menu.split("\\|\\|");

			for (int j = 0; j < menus.length; ++j) {
				DetailOrderVO vo = new DetailOrderVO();
				String[] oneMenu = menus[j].split("\\*");

				vo.setName(oneMenu[0]);
				vo.setBread(oneMenu[1]);
				vo.setCheese(oneMenu[2]);
				vo.setTopping(oneMenu[3]);
				vo.setVegetable(oneMenu[4]);
				vo.setSauce(oneMenu[5]);
				vo.setRequirement(oneMenu[6]);
				vo.setPic(oneMenu[7]);
				vo.setSize(oneMenu[8]);
				vo.setQty(new Integer(oneMenu[9]));
				vo.setPrice(oneMenu[10]);
				vo.setTotal_price(oneMenu[11]);
				list.add(vo);
			}
			orderList.get(i).setDetailOrderList(list);
		}
		
		return orderList;
	}
}
