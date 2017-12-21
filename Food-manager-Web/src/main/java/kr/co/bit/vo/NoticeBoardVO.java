package kr.co.bit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class NoticeBoardVO {
	
	private int no;
	private String writer;
	private String title;
	private String content;
	private String type;	// 공지사항 'A' / 보도자료 'B'
	private String fileOX;	// 파일 유 'O'/ 무 'X'
	private String regDate;
	private int viewCnt;
	// ********************************************
	// DB에 저장 안하고 쓰는 것들
	private List<MultipartFile> noticeFile;  //첨부파일임.
	private String temp;
	// ********************************************
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public List<MultipartFile> getNoticeFile() {
		return noticeFile;
	}
	public void setNoticeFile(List<MultipartFile> noticeFile) {
		this.noticeFile = noticeFile;
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
	@Override
	public String toString() {
		return "NoticeBoardVO [no=" + no + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", type=" + type + ", noticeFile=" + noticeFile + ", fileOX=" + fileOX + ", regDate=" + regDate
				+ ", viewCnt=" + viewCnt + "]";
	}
	
}
