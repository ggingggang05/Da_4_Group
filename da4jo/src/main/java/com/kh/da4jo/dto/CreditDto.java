package com.kh.da4jo.dto;

import java.sql.Date;

public class CreditDto
{
	private String memberId;
	private int creditCharge;
	private Date creditTimeDate;
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
	
	public CreditDto()
	{
		super();
	}
}
