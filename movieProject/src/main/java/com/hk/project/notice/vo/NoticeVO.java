package com.hk.project.notice.vo;

import java.util.Date;

public class NoticeVO {
	
	private int noticeNO;
	private String category;
	private String nTitle;
	private String nContent;
	private Date date;
	private int viewCount;
	
	public int getNoticeNO() {
		return noticeNO;
	}
	public void setNoticeNO(int noticeNO) {
		this.noticeNO = noticeNO;
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
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [noticeNO=" + noticeNO + ", category=" + category + ", nTitle=" + nTitle + ", nContent="
				+ nContent + ", date=" + date + ", viewCount=" + viewCount + "]";
	}
			
}
