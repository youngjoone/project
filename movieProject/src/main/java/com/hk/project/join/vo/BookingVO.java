package com.hk.project.join.vo;

import java.util.Date;

public class BookingVO {

	private String id;
	private String ticketNo;
	private String title;
	private Date screenTime;
	private String seat;
	private int price;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getScreenTime() {
		return screenTime;
	}
	public void setScreenTime(Date screenTime) {
		this.screenTime = screenTime;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "BookingVO [id=" + id + ", ticketNo=" + ticketNo + ", title=" + title + ", screenTime=" + screenTime
				+ ", seat=" + seat + ", price=" + price + ", age=" + age + "]";
	}
}
