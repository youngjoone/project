package com.hk.project.join.vo;

public class BookingDateVO {

	private String mid;
	private String screenNO;
	private String type;
	private String year;
	private String month;
	private String day;
	private String hour;
	private String minute;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getHour() {
		return hour;
	}
	public void setHour(String hour) {
		this.hour = hour;
	}
	public String getMinute() {
		return minute;
	}
	public void setMinute(String minute) {
		this.minute = minute;
	}
	@Override
	public String toString() {
		return "BookingDateVO [mid=" + mid + ", screenNO=" + screenNO + ", type=" + type + ", year=" + year + ", month="
				+ month + ", day=" + day + ", hour=" + hour + ", minute=" + minute + "]";
	}
	
	
}
