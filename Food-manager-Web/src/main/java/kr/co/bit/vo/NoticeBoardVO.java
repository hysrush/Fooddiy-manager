package kr.co.bit.vo;

public class NoticeBoardVO {
	
	private int no;
	private String writer;
	private String title;
	private String content;
	private String type;	// 공지사항 'A' / 보도자료 'B'
//	private String file;  첨부파일임.
	private String regDate;
	private int viewCnt;
	
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
	@Override
	public String toString() {
		return "NoticeBoardVO [no=" + no + ", type=" + type + ", writer=" + writer + ", title=" + title + ", content="
				+ content + ", regDate=" + regDate + ", viewCnt=" + viewCnt + "]";
	}

}
