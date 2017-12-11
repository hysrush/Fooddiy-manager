package kr.co.bit.vo;

public class UserVO {
	
	private int no;
	private String id;
	private String name;
	private String pw;
	private String birth;
	private String sex;
	private String email;
	private String phone;
	private String store;
	//private 사진첨부 보류  알아오기
	private String file;
	private String grade;
	private String root;
	private String type;
	private String regDate;
	
	
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPw() {
		return pw;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getBirth() {
		return birth;
	}
	
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	public String getSex() {
		return sex;
	}
	
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public String getGrade() {
		return grade;
	}
	
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public String getRoot() {
		return root;
	}

	public void setRoot(String root) {
		this.root = root;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getRegDate() {
		return regDate;
	}
	
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "UserVO [no=" + no + ", id=" + id + ", name=" + name + ", pw=" + pw + ", birth=" + birth + ", sex=" + sex
				+ ", email=" + email + ", phone=" + phone + ", store=" + store + ", file=" + file + ", grade=" + grade
				+ ", root=" + root + ", type=" + type + ", regDate=" + regDate + "]";
	}
	
}