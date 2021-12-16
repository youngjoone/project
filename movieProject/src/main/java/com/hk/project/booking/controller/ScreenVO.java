package com.hk.project.booking.controller;

public class ScreenVO {

	private String screenNo;
	private String seat;
	
	public String getScreenNo() {
		return screenNo;
	}
	public void setScreenNo(String screenNo) {
		this.screenNo = screenNo;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	
	@Override
	public String toString() {
		return "BookingVO2 [screenNo=" + screenNo + ", seat=" + seat + "]";
	}
}
