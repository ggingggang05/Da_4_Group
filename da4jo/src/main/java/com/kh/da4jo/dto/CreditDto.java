package com.kh.da4jo.dto;

import java.sql.Date;

public class CreditDto
{
	private int creditNo;
	private String memberId;
	private int creditCharge;
	private Date creditTimeDate;
	private String creditStatus;
	
	
	public int getCreditNo() {
		return creditNo;
	}
	public void setCreditNo(int creditNo) {
		this.creditNo = creditNo;
	}
	public String getMemberId()
	{
		return memberId;
	}
	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}
	public int getCreditCharge()
	{
		return creditCharge;
	}
	public void setCreditCharge(int creditCharge)
	{
		this.creditCharge = creditCharge;
	}
	public Date getCreditTimeDate()
	{
		return creditTimeDate;
	}
	public void setCreditTimeDate(Date creditTimeDate)
	{
		this.creditTimeDate = creditTimeDate;
	}
	
	public String getCreditStatus() {
		return creditStatus;
	}
	public void setCreditStatus(String creditStatus) {
		this.creditStatus = creditStatus;
	}
	public CreditDto()
	{
		super();
	}
	@Override
	public String toString() {
		return "CreditDto [memberId=" + memberId + ", creditCharge=" + creditCharge + ", creditTimeDate="
				+ creditTimeDate + ", creditStatus=" + creditStatus + "]";
	}
	
	
}
