package kr.co.bit.vo;

public class MailVO {
	
	private String sender;
	private String subject;
	private String content;
	private String receiver;
	
	public String getSubject() {
		return subject;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getReceiver() {
		return receiver;
	}
	
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	@Override
	public String toString() {
		return "MailVO [sender=" + sender + ", subject=" + subject + ", content=" + content + ", receiver=" + receiver
				+ "]";
	}
	
}
