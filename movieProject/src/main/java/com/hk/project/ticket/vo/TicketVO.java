package com.hk.project.ticket.vo;

public class TicketVO {
	
	private String id;
	private String ticketNo;
	private String screenDateNo;
	private String screenNo;
	private String seatNo;
	private String age;
	private String mid;
	//리뷰유무확인차
	private int score;
	
	
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
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	@Override
	public String toString() {
		return "TicketVO [id=" + id + ", ticketNo=" + ticketNo + ", screenDateNo=" + screenDateNo + ", screenNo="
				+ screenNo + ", seatNo=" + seatNo + ", age=" + age + ", mid=" + mid + ", score=" + score + "]";
	}
	
	

}
