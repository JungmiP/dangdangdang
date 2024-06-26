package kr.ac.kopo.vo;

public class SubscriptionVO {
	private int no;
	private int paymentNo;
	private String memberId;
	private int passNo;
	private String startDate;
	private String endDate;
	private int remainClasses;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getPassNo() {
		return passNo;
	}
	public void setPassNo(int passNo) {
		this.passNo = passNo;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getRemainClasses() {
		return remainClasses;
	}
	public void setRemainClasses(int remainClasses) {
		this.remainClasses = remainClasses;
	}
	
	@Override
	public String toString() {
		return "SubscriptionVO [no=" + no + ", paymentNo=" + paymentNo + ", memberId=" + memberId + ", passNo=" + passNo
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", remainClasses=" + remainClasses + "]";
	}
	
	
}
