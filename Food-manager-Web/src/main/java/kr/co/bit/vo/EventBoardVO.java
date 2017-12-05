package kr.co.bit.vo;

public class EventBoardVO {

	private int no;
	private String storeName;
	private String title;
	private String imgFileName; // 泥⑤��뙆�씪
	private String content;
	private String startDate;
	private String endDate;
	private String regDate;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getImgFileName() {
		return imgFileName;
	}
	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "EventBoardVO [no=" + no + ", storeName=" + storeName + ", title=" + title + ", imgFileName="
				+ imgFileName + ", content=" + content + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", regDate=" + regDate + "]";
	}
	
	
	
	
	
	
	
}
