package kr.co.bit.vo;


public class QnaBoardVO {
	
	private int no;
	private String question;
	private String answer;
	private String type;	// 푸디오더 'F' / 포인트 'P' / 주문 'O' / 회원정보 'M' / 기타 'X'
	private String regDate;
	
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
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "QnaBoardVO [no=" + no + ", type=" + type + ", question=" + question + ", answer=" + answer
				+ ", regDate=" + regDate + "]";
	}
	
}
