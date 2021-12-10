package com.hk.project.notice.vo;

import java.util.Date;

public class NoticeVO {
	
	private int noticeNo;
	private String category;
	private String nTitle;
	private String nContent;
	private Date date;
	
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", category=" + category + ", nTitle=" + nTitle + ", nContent="
				+ nContent + ", date=" + date + "]";
	}
	
	

}
