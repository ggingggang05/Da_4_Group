package com.kh.da4jo.dto;

import java.sql.Date;

public class NoticeDto {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	private Date noticeWdate;
	private int noticeVcount;
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public Date getNoticeWdate() {
		return noticeWdate;
	}
	public void setNoticeWdate(Date noticeWdate) {
		this.noticeWdate = noticeWdate;
	}
	public int getNoticeVcount() {
		return noticeVcount;
	}
	public void setNoticeVcount(int noticeVcount) {
		this.noticeVcount = noticeVcount;
	}
	public NoticeDto() {
		super();
	}
	
	
	
}
