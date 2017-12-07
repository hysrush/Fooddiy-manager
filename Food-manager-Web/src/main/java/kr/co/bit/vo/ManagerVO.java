package kr.co.bit.vo;

public class ManagerVO {

	private String name;
	private String id;
	private String pw;
	private String branch;
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPw() {
		return pw;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getBranch() {
		return branch;
	}
	
	public void setBranch(String branch) {
		this.branch = branch;
	}

	@Override
	public String toString() {
		return "ManagerVO [name=" + name + ", id=" + id + ", pw=" + pw + ", branch=" + branch + "]";
	}
	
}
