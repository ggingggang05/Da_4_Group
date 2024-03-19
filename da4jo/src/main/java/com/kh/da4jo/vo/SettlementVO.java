package com.kh.da4jo.vo;

import java.sql.Date;

//일자별 결제내역
public class SettlementVO {
	private Date poPayDate;
	private int poTotalPrice;
	
	
	public SettlementVO() {
		super();
	}
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

	
}
