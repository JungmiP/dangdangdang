package kr.ac.kopo.vo;

public class ReservationVO {
	private int no;
	private String memberId;
	private String status;
	private String reserveDate;
	private String detail;
	private String regDate;
	
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "ReservationVO [no=" + no + ", memberId=" + memberId + ", status=" + status + ", reserveDate="
				+ reserveDate + ", detail=" + detail + ", regDate=" + regDate + "]";
	}
	
}
