package kr.co.bit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ClaimBoardVO {
	
	private int no;
	private String title;
	private String content;
	private String type;		// 문의 'I' / 칭찬 'P' / 불만 'C' / 제안 'S' / 기타 'X'
	private String writer;		// User ID
	private String emailID;		// User Email
	private String emailDomain;
	private String phone1;		// User Phone
	private String phone2;
	private String phone3;
	private String visitDate;	// 방문일
	private String visitStore;	// 방문 매장명
	
	private String fileOX;	// 파일 유 'O'/ 무 'X'
	private String regDate;
	private int viewCnt;
	// ********************************************
	// DB에 저장 안하고 쓰는 것들
	private List<MultipartFile> claimFile;  //첨부파일임.
	private String temp;
	// ********************************************
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getEmailID() {
		return emailID;
	}
	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	public String getEmailDomain() {
		return emailDomain;
	}
	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}
	public String getVisitStore() {
		return visitStore;
	}
	public void setVisitStore(String visitStore) {
		this.visitStore = visitStore;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getFileOX() {
		return fileOX;
	}
	public void setFileOX(String fileOX) {
		this.fileOX = fileOX;
	}
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	public List<MultipartFile> getClaimFile() {
		return claimFile;
	}
	public void setClaimFile(List<MultipartFile> claimFile) {
		this.claimFile = claimFile;
	}
	@Override
	public String toString() {
		return "ClaimBoardVO [no=" + no + ", title=" + title + ", content=" + content + ", type=" + type + ", writer="
				+ writer + ", emailID=" + emailID + ", emailDomain=" + emailDomain + ", phone1=" + phone1 + ", phone2="
				+ phone2 + ", phone3=" + phone3 + ", visitDate=" + visitDate + ", visitStore=" + visitStore
				+ ", fileOX=" + fileOX + ", regDate=" + regDate + ", viewCnt=" + viewCnt + ", claimFile=" + claimFile
				+ "]";
	}
	
}
