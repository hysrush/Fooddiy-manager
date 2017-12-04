package kr.co.bit.menu.vo;

public class MenuVO {

	private int no;
	private String name;
	private String mainmenu;
	// 추천 'R' / 프리미엄 'P' / 베스트 'B' / 클래식 'C' / 아침식사 'M' / 샐러드 'S' / 추가메뉴 'N' / 음료 'D'
	private String type;
	private int price;
	private String detail;
	private String imgFileName;
//	private String imgFileName2;
	private float serviceSize;
	private float calorie;
	private float protein;
	private float natrium;
	private float sugar;
	private float fat;
	private String allergy;	
	private String regDate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMainmenu() {
		return mainmenu;
	}
	public void setMainmenu(String mainmenu) {
		this.mainmenu = mainmenu;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getImgFileName() {
		return imgFileName;
	}
	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}
/*	public String getImgFileName2() {
		return imgFileName2;
	}
	public void setImgFileName2(String imgFileName2) {
		this.imgFileName2 = imgFileName2;
	}*/
	public float getServiceSize() {
		return serviceSize;
	}
	public void setServiceSize(float serviceSize) {
		this.serviceSize = serviceSize;
	}
	public float getCalorie() {
		return calorie;
	}
	public void setCalorie(float calorie) {
		this.calorie = calorie;
	}
	public float getProtein() {
		return protein;
	}
	public void setProtein(float protein) {
		this.protein = protein;
	}
	public float getNatrium() {
		return natrium;
	}
	public void setNatrium(float natrium) {
		this.natrium = natrium;
	}
	public float getSugar() {
		return sugar;
	}
	public void setSugar(float sugar) {
		this.sugar = sugar;
	}
	public float getFat() {
		return fat;
	}
	public void setFat(float fat) {
		this.fat = fat;
	}
	public String getAllergy() {
		return allergy;
	}
	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "MenuVO [no=" + no + ", name=" + name + ", mainmenu=" + mainmenu + ", type=" + type + ", price=" + price
				+ ", detail=" + detail + ", imgFileName=" + imgFileName + ", serviceSize=" + serviceSize + ", calorie="
				+ calorie + ", protein=" + protein + ", natrium=" + natrium + ", sugar=" + sugar + ", fat=" + fat
				+ ", allergy=" + allergy + ", regDate=" + regDate + "]";
	}
	
	
	
	
	
	
}
