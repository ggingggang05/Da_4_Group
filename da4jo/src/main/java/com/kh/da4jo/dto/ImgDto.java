package com.kh.da4jo.dto;

import java.sql.Date;

public class ImgDto
{
	private int imgNo;
	private String imgName;
	private String imgType;
	private long imgSize;
	private Date imgUptimeDate;
	public int getImgNo()
	{
		return imgNo;
	}
	public void setImgNo(int imgNo)
	{
		this.imgNo = imgNo;
	}
	public String getImgName()
	{
		return imgName;
	}
	public void setImgName(String imgName)
	{
		this.imgName = imgName;
	}
	public String getImgType()
	{
		return imgType;
	}
	public void setImgType(String imgType)
	{
		this.imgType = imgType;
	}
	public long getImgSize()
	{
		return imgSize;
	}
	public void setImgSize(long imgSize)
	{
		this.imgSize = imgSize;
	}
	public Date getImgUptimeDate()
	{
		return imgUptimeDate;
	}
	public void setImgUptimeDate(Date imgUptimeDate)
	{
		this.imgUptimeDate = imgUptimeDate;
	}
	public ImgDto()
	{
		super();
	}
}
