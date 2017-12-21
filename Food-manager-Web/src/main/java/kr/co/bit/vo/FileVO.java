package kr.co.bit.vo;

public class FileVO {
	
	private int no;
	private String name;
	private String fileOriName;
	private String fileSaveName;
	private double fileSize;
	private String contentType;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFileOriName() {
		return fileOriName;
	}
	public void setFileOriName(String fileOriName) {
		this.fileOriName = fileOriName;
	}
	public String getFileSaveName() {
		return fileSaveName;
	}
	public void setFileSaveName(String fileSaveName) {
		this.fileSaveName = fileSaveName;
	}
	public double getFileSize() {
		return fileSize;
	}
	public void setFileSize(double fileSize) {
		this.fileSize = fileSize;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	@Override
	public String toString() {
		return "FileVO [no=" + no + ", name=" + name + ", fileOriName=" + fileOriName + ", fileSaveName=" + fileSaveName
				+ ", fileSize=" + fileSize + ", contentType=" + contentType + "]";
	}
	
	
}
