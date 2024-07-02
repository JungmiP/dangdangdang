package kr.ac.kopo.vo;

public class RefundVO {
	private int no;
	private int paymentNo;
	private int amount;
	private String refundDate;
	private String reason;
	private String status;
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getRefundDate() {
		return refundDate;
	}
	public void setRefundDate(String refundDate) {
		this.refundDate = refundDate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "RefundVO [no=" + no + ", paymentNo=" + paymentNo + ", amount=" + amount + ", refundDate=" + refundDate
				+ ", reason=" + reason + ", status=" + status + "]";
	}
	
	
}
