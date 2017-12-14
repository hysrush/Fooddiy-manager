package kr.co.bit.vo;

import java.util.List;

public class OrderVO {

	private int no;
	private String storeName;
	private String id;
	private String order_price;
	private String final_price;
	private String menu;
	private List<DetailOrderVO> detailOrderList;
	private String eatType;
	private String payment;
	private int orderStatus;		// 0 : 주문취소 , 2 : 대기중 , 3 : 준비중  , 4 : 준비완료
	private String regDate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrder_price() {
		return order_price;
	}
	public void setOrder_price(String order_price) {
		this.order_price = order_price;
	}
	public String getFinal_price() {
		return final_price;
	}
	public void setFinal_price(String final_price) {
		this.final_price = final_price;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public List<DetailOrderVO> getDetailOrderList() {
		return detailOrderList;
	}
	public void setDetailOrderList(List<DetailOrderVO> detailOrderList) {
		this.detailOrderList = detailOrderList;
	}
	public String getEatType() {
		return eatType;
	}
	public void setEatType(String eatType) {
		this.eatType = eatType;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "OrderVO [no=" + no + ", storeName=" + storeName + ", id=" + id + ", order_price=" + order_price
				+ ", final_price=" + final_price + ", menu=" + menu + ", detailOrderList=" + detailOrderList
				+ ", eatType=" + eatType + ", payment=" + payment + ", orderStatus=" + orderStatus + ", regDate="
				+ regDate + ", getNo()=" + getNo() + ", getStoreName()=" + getStoreName() + ", getId()=" + getId()
				+ ", getOrder_price()=" + getOrder_price() + ", getFinal_price()=" + getFinal_price() + ", getMenu()="
				+ getMenu() + ", getEatType()=" + getEatType() + ", getPayment()=" + getPayment()
				+ ", getOrderStatus()=" + getOrderStatus() + ", getRegDate()=" + getRegDate() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
