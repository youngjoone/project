package com.hk.project.ticket.vo;

public class TicketVO {
	
	private String id;
	private String ticketNo;
	private String screenDateNo;
	private String screenNo;
	private String age;
	
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
	public String getScreenDateNo() {
		return screenDateNo;
	}
	public void setScreenDateNo(String screenDateNo) {
		this.screenDateNo = screenDateNo;
	}
	public String getScreenNo() {
		return screenNo;
	}
	public void setScreenNo(String screenNo) {
		this.screenNo = screenNo;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "TicketVO [id=" + id + ", ticketNo=" + ticketNo + ", screenDateNo=" + screenDateNo + ", screenNo="
				+ screenNo + ", age=" + age + "]";
	}
	

}
