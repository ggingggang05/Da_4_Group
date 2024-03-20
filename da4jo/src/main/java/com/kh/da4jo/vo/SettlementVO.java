package com.kh.da4jo.vo;

import java.sql.Date;import javax.xml.stream.events.StartDocument;

//일자별 결제내역
public class SettlementVO {
	private Date poPayDate;
	private int poTotalPrice;
	private int count;
	private String startDate;
	private String endDate;
	
	public Date getPoPayDate() {
		return poPayDate;
	}
	public void setPoPayDate(Date poPayDate) {
		this.poPayDate = poPayDate;
	}
	public int getPoTotalPrice() {
		return poTotalPrice;
	}
	public void setPoTotalPrice(int poTotalPrice) {
		this.poTotalPrice = poTotalPrice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public SettlementVO() {
		super();
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public boolean isSearch() {
		return startDate != null && endDate != null;
	}
	
}
