package com.hk.project.notice.vo;

import java.util.Date;

public class NoticeVO {
	
	private Number noticeno;
	private String category;
	private String ntitle;
	private String ncontent;
	private Date date;
	
	
	public Number getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(Number noticeno) {
		this.noticeno = noticeno;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [noticeno=" + noticeno + ", category=" + category + ", ntitle=" + ntitle + ", ncontent="
				+ ncontent + ", date=" + date + "]";
	}
	
	
}
