package com.kh.da4jo.vo;

import java.sql.Date;

// 풋터에 공지 리스트를 띄워주기 위한 매퍼에 들어가는 필드값
public class NoticeVO {
	private String noticeTitle;
	private Date noticeWdate;
	private int noticeNo;
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public NoticeVO() {
		super();
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public Date getNoticeWdate() {
		return noticeWdate;
	}
	public void setNoticeWdate(Date noticeWdate) {
		this.noticeWdate = noticeWdate;
	}
	
	

}
