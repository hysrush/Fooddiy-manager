package kr.co.bit.vo;

public class OrderVO {

	private int no;
	private String storeName;
	private String id;
	private String final_price;
	private String menu;

	private String eatType;
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
	public String getEatType() {
		return eatType;
	}
	public void setEatType(String eatType) {
		this.eatType = eatType;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "OrderVO [no=" + no + ", storeName=" + storeName + ", id=" + id + ", final_price=" + final_price
				+ ", menu=" + menu + ", eatType=" + eatType + ", regDate=" + regDate + "]";
	}
	

}
