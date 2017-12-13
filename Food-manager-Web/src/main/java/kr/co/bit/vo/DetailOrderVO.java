package kr.co.bit.vo;

public class DetailOrderVO {
	
	private String name;
	private String price;
	private String total_price;
	private String size;
	private String pic;
	private int qty;
	
	private String bread;
	private String cheese;
	private String topping;
	private String vegetable;
	private String sauce;
	private String requirement;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getBread() {
		return bread;
	}
	public void setBread(String bread) {
		this.bread = bread;
	}
	public String getCheese() {
		return cheese;
	}
	public void setCheese(String cheese) {
		this.cheese = cheese;
	}
	public String getTopping() {
		return topping;
	}
	public void setTopping(String topping) {
		this.topping = topping;
	}
	public String getVegetable() {
		return vegetable;
	}
	public void setVegetable(String vegetable) {
		this.vegetable = vegetable;
	}
	public String getSauce() {
		return sauce;
	}
	public void setSauce(String sauce) {
		this.sauce = sauce;
	}
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	@Override
	public String toString() {
		return "DetailOrderVO [name=" + name + ", price=" + price + ", total_price=" + total_price + ", size=" + size
				+ ", pic=" + pic + ", qty=" + qty + ", bread=" + bread + ", cheese=" + cheese + ", topping=" + topping
				+ ", vegetable=" + vegetable + ", sauce=" + sauce + ", requirement=" + requirement + "]";
	}
}
