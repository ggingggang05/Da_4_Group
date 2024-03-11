package com.kh.da4jo.dto;

import java.sql.Date;

public class QnaDto {
	private int qnaNo;
	private String qnaSecreate;
	private String qnaTitle;
	private String qnaContent;
	private String qnaWriter;
	private Date qnaWdate;
	private int qnaVcount;
	
	public QnaDto() {
		super();
	}
	
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaSecreate() {
		return qnaSecreate;
	}
	public void setQnaSecreate(String qnaSecreate) {
		this.qnaSecreate = qnaSecreate;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaWriter() {
		return qnaWriter;
	}
	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}
	public Date getQnaWdate() {
		return qnaWdate;
	}
	public void setQnaWdate(Date qnaWdate) {
		this.qnaWdate = qnaWdate;
	}
	public int getQnaVcount() {
		return qnaVcount;
	}
	public void setQnaVcount(int qnaVcount) {
		this.qnaVcount = qnaVcount;
	}
	
	
}