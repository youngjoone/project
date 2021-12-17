package com.hk.project.screen.vo;

public class ScreenVO {

	public String screenNO;
	public String seat;
	
	public String getScreenNO() {
		return screenNO;
	}
	public void setScreenNO(String screenNO) {
		this.screenNO = screenNO;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	
	@Override
	public String toString() {
		return "ScreenVO [screenNO=" + screenNO + ", seat=" + seat + "]";
	}
}
