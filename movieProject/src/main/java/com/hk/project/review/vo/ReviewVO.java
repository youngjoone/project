package com.hk.project.review.vo;

import java.util.Date;

public class ReviewVO {

	private String id;
	private String mid;
	private String rContent;
	private int score;
	private Date rDate;
	private String ticketNo;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public String getTicketNo() {
		return ticketNo;
	}
	public void setTicketNo(String ticketNo) {
		this.ticketNo = ticketNo;
	}
	

	@Override
	public String toString() {
		return "ReviewVO [id=" + id + ", mid=" + mid + ", rContent=" + rContent + ", score=" + score + ", rDate="
				+ rDate + ", ticketNo=" + ticketNo + "]";
	}
}
