package com.hk.project.join.vo;

public class ListTicketVO {

	private String tDate;
	private String tTime;
	private String id;
	private String ticketNo;
	private String screenNo;
	private String seatNo;
	private String age;
	private String mid;
	private String TITLE;
	
	public String gettDate() {
		return tDate;
	}
	public void settDate(String tDate) {
		this.tDate = tDate;
	}
	public String gettTime() {
		return tTime;
	}
	public void settTime(String tTime) {
		this.tTime = tTime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTicketNo() {
		return ticketNo;
	}
	public void setTicketNo(String ticketNo) {
		this.ticketNo = ticketNo;
	}
	public String getScreenNo() {
		return screenNo;
	}
	public void setScreenNo(String screenNo) {
		this.screenNo = screenNo;
	}
	public String getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	@Override
	public String toString() {
		return "ListTicketVO [tDate=" + tDate + ", tTime=" + tTime + ", id=" + id + ", ticketNo=" + ticketNo
				+ ", screenNo=" + screenNo + ", seatNo=" + seatNo + ", age=" + age + ", mid=" + mid + ", TITLE=" + TITLE
				+ "]";
	}

	
}	