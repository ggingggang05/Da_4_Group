package com.kh.da4jo.vo;

import java.sql.Date;

//일자별 상세
public class DailyDetailVO {
	private Date poPayDate;
	private int poNo;
	private String poCustomerId;
	private String poNameKor;
	private String poItemEngName;
	private int poTotalPriceKrw; // 원화금액	
	private int poQty; // 상품수량 디폴트1
	private double poItemVat;
	private String poAwbNumber;
	private Date poSdate;
	
	public DailyDetailVO() {
		super();
	}
	public Date getPoPayDate() {
		return poPayDate;
	}
	public void setPoPayDate(Date poPayDate) {
		this.poPayDate = poPayDate;
	}
	public int getPoNo() {
		return poNo;
	}
	public void setPoNo(int poNo) {
		this.poNo = poNo;
	}
	public String getPoCustomerId() {
		return poCustomerId;
	}
	public void setPoCustomerId(String poCustomerId) {
		this.poCustomerId = poCustomerId;
	}
	public String getPoNameKor() {
		return poNameKor;
	}
	public void setPoNameKor(String poNameKor) {
		this.poNameKor = poNameKor;
	}
	public String getPoItemEngName() {
		return poItemEngName;
	}
	public void setPoItemEngName(String poItemEngName) {
		this.poItemEngName = poItemEngName;
	}
	public int getPoTotalPriceKrw() {
		return poTotalPriceKrw;
	}
	public void setPoTotalPriceKrw(int poTotalPriceKrw) {
		this.poTotalPriceKrw = poTotalPriceKrw;
	}
	public int getPoQty() {
		return poQty;
	}
	public void setPoQty(int poQty) {
		this.poQty = poQty;
	}
	public double getPoItemVat() {
		return poItemVat;
	}
	public void setPoItemVat(double poItemVat) {
		this.poItemVat = poItemVat;
	}
	public String getPoAwbNumber() {
		return poAwbNumber;
	}
	public void setPoAwbNumber(String poAwbNumber) {
		this.poAwbNumber = poAwbNumber;
	}
	public Date getPoSdate() {
		return poSdate;
	}
	public void setPoSdate(Date poSdate) {
		this.poSdate = poSdate;
	}
}
