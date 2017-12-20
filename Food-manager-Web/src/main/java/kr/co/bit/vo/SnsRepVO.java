package kr.co.bit.vo;

public class SnsRepVO {
	
	private int repNo;
	private int snsNo;
	private String id;
	private String pic;
	private String content;
	private String regDate;
	public int getRepNo() {
		return repNo;
	}
	public void setRepNo(int repNo) {
		this.repNo = repNo;
	}
	public int getSnsNo() {
		return snsNo;
	}
	public void setSnsNo(int snsNo) {
		this.snsNo = snsNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "SnsRepVO [repNo=" + repNo + ", snsNo=" + snsNo + ", id=" + id + ", pic=" + pic + ", content=" + content
				+ ", regDate=" + regDate + "]";
	}
	
	
	
	

}
