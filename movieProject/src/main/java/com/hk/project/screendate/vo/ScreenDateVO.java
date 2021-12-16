package com.hk.project.screendate.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ScreenDateVO {

	public String screenDateNO;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	public Date screenTime;
	public String mid;
	public String screenNO;
	public String getScreenDateNO() {
		return screenDateNO;
	}
	public void setScreenDateNO(String screenDateNO) {
		this.screenDateNO = screenDateNO;
	}
	public Date getScreenTime() {
		return screenTime;
	}
	public void setScreenTime(Date screenTime) {
		this.screenTime = screenTime;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getScreenNO() {
		return screenNO;
	}
	public void setScreenNO(String screenNO) {
		this.screenNO = screenNO;
	}
	@Override
	public String toString() {
		return "ScreenDateVO [screenDateNO=" + screenDateNO + ", screenTime=" + screenTime + ", mid=" + mid
				+ ", screenNO=" + screenNO + "]";
	}
	
	
}
