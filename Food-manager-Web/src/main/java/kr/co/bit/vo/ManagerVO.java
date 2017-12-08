package kr.co.bit.vo;

public class ManagerVO {

	private String name;
	private String id;
	private String pw;
	private String phone;
	private int post1;
	private int post2;
	private String addr1;
	private String addr2;
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

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
	
	public int getPost1() {
		return post1;
	}
	
	public void setPost1(int post1) {
		this.post1 = post1;
	}
	
	public int getPost2() {
		return post2;
	}
	
	public void setPost2(int post2) {
		this.post2 = post2;
	}
	
	public String getAddr1() {
		return addr1;
	}
	
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	
	public String getAddr2() {
		return addr2;
	}
	
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	@Override
	public String toString() {
		return "ManagerVO [name=" + name + ", id=" + id + ", pw=" + pw + ", phone=" + phone + ", post1=" + post1
				+ ", post2=" + post2 + ", addr1=" + addr1 + ", addr2=" + addr2 + "]";
	}
	
}
