package kr.ac.kopo.vo;

public class PaymentVO {
	private int no;
	private String memberId;
	private int passNo;
	private int amount;
	private String payMethod;
	private String payDate;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	
	@Override
	public String toString() {
		return "PaymentVO [no=" + no + ", memberId=" + memberId + ", passNo=" + passNo + ", amount=" + amount
				+ ", payMethod=" + payMethod + ", payDate=" + payDate + "]";
	}

	
}