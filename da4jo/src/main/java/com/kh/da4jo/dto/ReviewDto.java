package com.kh.da4jo.dto;

import java.sql.Date;

public class ReviewDto {

	private int reviewNo;
	private String reviewTitle;
	private String reviewContent; 
	private String reviewWriter;
	private Date reviewWdate;
	private int reviewVcount;
	private int reviewStar;
	
	public ReviewDto() {
		super();
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewWriter() {
		return reviewWriter;
	}
	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}
	public Date getReviewWdate() {
		return reviewWdate;
	}
	public void setReviewWdate(Date reviewWdate) {
		this.reviewWdate = reviewWdate;
	}
	public int getReviewVcount() {
		return reviewVcount;
	}
	public void setReviewVcount(int reviewVcount) {
		this.reviewVcount = reviewVcount;
	}
	public int getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}
	
}
