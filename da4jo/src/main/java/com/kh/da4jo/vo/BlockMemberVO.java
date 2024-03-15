package com.kh.da4jo.vo;

import java.sql.Date;

public class BlockMemberVO
{
	private String memberId;
	private String memberNameKor;
	private String blockStatus;
	private Date blockTimeDate;
	private String blockReason;
	public String getMemberId()
	{
		return memberId;
	}
	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}
	public String getMemberNameKor()
	{
		return memberNameKor;
	}
	public void setMemberNameKor(String memberNameKor)
	{
		this.memberNameKor = memberNameKor;
	}
	public String getBlockStatus()
	{
		return blockStatus;
	}
	public void setBlockStatus(String blockStatus)
	{
		this.blockStatus = blockStatus;
	}
	public Date getBlockTimeDate()
	{
		return blockTimeDate;
	}
	public void setBlockTimeDate(Date blockTimeDate)
	{
		this.blockTimeDate = blockTimeDate;
	}
	public String getBlockReason()
	{
		return blockReason;
	}
	public void setBlockReason(String blockReason)
	{
		this.blockReason = blockReason;
	}
	public BlockMemberVO()
	{
		super();
	}
}
