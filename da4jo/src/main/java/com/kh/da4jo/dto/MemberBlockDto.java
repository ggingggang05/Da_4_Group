package com.kh.da4jo.dto;

import java.sql.Date;

public class MemberBlockDto
{
	private int blockNo;
	private String blockMemberId;
	private Date blockTimeDate;
	private String blockStatus;
	private String blockReason;
	public int getBlockNo()
	{
		return blockNo;
	}
	public void setBlockNo(int blockNo)
	{
		this.blockNo = blockNo;
	}
	public String getBlockMemberId()
	{
		return blockMemberId;
	}
	public void setBlockMemberId(String blockMemberId)
	{
		this.blockMemberId = blockMemberId;
	}
	public Date getBlockTimeDate()
	{
		return blockTimeDate;
	}
	public void setBlockTimeDate(Date blockTimeDate)
	{
		this.blockTimeDate = blockTimeDate;
	}
	public String getBlockStatus()
	{
		return blockStatus;
	}
	public void setBlockStatus(String blockStatus)
	{
		this.blockStatus = blockStatus;
	}
	public String getBlockReason()
	{
		return blockReason;
	}
	public void setBlockReason(String blockReason)
	{
		this.blockReason = blockReason;
	}
	public MemberBlockDto()
	{
		super();
	}
}
