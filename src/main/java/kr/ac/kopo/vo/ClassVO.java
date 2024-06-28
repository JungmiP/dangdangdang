package kr.ac.kopo.vo;

public class ClassVO {
	private int no;
	private String teacherId;
	private int dogNo;
	private int subscriptionNo;
	private String classDate;
	private String status;
	private String attendance;
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
	public int getDogNo() {
		return dogNo;
	}
	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}
	public int getSubscriptionNo() {
		return subscriptionNo;
	}
	public void setSubscriptionNo(int subscriptionNo) {
		this.subscriptionNo = subscriptionNo;
	}
	public String getClassDate() {
		return classDate;
	}
	public void setClassDate(String classDate) {
		this.classDate = classDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAttendance() {
		return attendance;
	}
	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "ClassVO [no=" + no + ", teacherId=" + teacherId + ", dogNo=" + dogNo + ", subscriptionNo="
				+ subscriptionNo + ", classDate=" + classDate + ", status=" + status + ", attendance=" + attendance
				+ ", regDate=" + regDate + "]";
	}
	
	
}
