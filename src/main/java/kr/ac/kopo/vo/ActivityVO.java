package kr.ac.kopo.vo;

public class ActivityVO {
	private int no;
	private String teacherId;
	private String activityDate;
	private String content;
	private String imgOriName;
	private String imgSaveName;
	private int imgSize;
	private String regDate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	public String getActivityDate() {
		return activityDate;
	}
	public void setActivityDate(String activityDate) {
		this.activityDate = activityDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgOriName() {
		return imgOriName;
	}
	public void setImgOriName(String imgOriName) {
		this.imgOriName = imgOriName;
	}
	public String getImgSaveName() {
		return imgSaveName;
	}
	public void setImgSaveName(String imgSaveName) {
		this.imgSaveName = imgSaveName;
	}
	public int getImgSize() {
		return imgSize;
	}
	public void setImgSize(int imgSize) {
		this.imgSize = imgSize;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "ActivityVO [no=" + no + ", teacherId=" + teacherId + ", activityDate=" + activityDate + ", content="
				+ content + ", imgOriName=" + imgOriName + ", imgSaveName=" + imgSaveName + ", imgSize=" + imgSize
				+ ", regDate=" + regDate + "]";
	}
}