package kr.ac.kopo.vo;

public class PassVO {
	private int no;
	private String name;
	private String description;
	private int price;
	private int duration;
	private int totalClasses;
	
	
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public int getTotalClasses() {
		return totalClasses;
	}
	public void setTotalClasses(int totalClasses) {
		this.totalClasses = totalClasses;
	}
	
	@Override
	public String toString() {
		return "PassVO [no=" + no + ", name=" + name + ", description=" + description + ", price=" + price
				+ ", duration=" + duration + ", totalClasses=" + totalClasses + "]";
	}
	
}
