package com.hk.project.ticket.vo;

public class TicketVO {
	
	private String id;
	private String ticketno;
	private String screendateno;
	private String screenno;
	private String age;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTicketno() {
		return ticketno;
	}
	public void setTicketno(String ticketno) {
		this.ticketno = ticketno;
	}
	public String getScreendateno() {
		return screendateno;
	}
	public void setScreendateno(String screendateno) {
		this.screendateno = screendateno;
	}
	public String getScreenno() {
		return screenno;
	}
	public void setScreenno(String screenno) {
		this.screenno = screenno;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "TicketVO [id=" + id + ", ticketno=" + ticketno + ", screendateno=" + screendateno + ", screenno="
				+ screenno + ", age=" + age + "]";
	}

}
