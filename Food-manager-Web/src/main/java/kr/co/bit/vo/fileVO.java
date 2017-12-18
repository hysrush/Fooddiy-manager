package kr.co.bit.vo;

public class fileVO {
	private String name;
	private String fileOriName;
	private String fileSaveName;
	private long fileSize;
	private String contentType;
	
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
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
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
		return "fileVO [name=" + name + ", fileOriName=" + fileOriName + ", fileSaveName=" + fileSaveName
				+ ", fileSize=" + fileSize + ", contentType=" + contentType + "]";
	}
	
}
