package dto;

public class PoDto
{
	private int poNo;
	private String poCustomer;
	private String poContact;
	private String poLink;
	private int poQty;
	private String poRComment; //Request Comment
	private String poZipcode;
	private String poAddress1;
	private String poAddress2;
	private String poDComment; //Delivery Comment
	private String poStatus;
	private double poTotalPrice;
	public int getPoNo()
	{
		return poNo;
	}
	public void setPoNo(int poNo)
	{
		this.poNo = poNo;
	}
	public String getPoCustomer()
	{
		return poCustomer;
	}
	public void setPoCustomer(String poCustomer)
	{
		this.poCustomer = poCustomer;
	}
	public String getPoContact()
	{
		return poContact;
	}
	public void setPoContact(String poContact)
	{
		this.poContact = poContact;
	}
	public String getPoLink()
	{
		return poLink;
	}
	public void setPoLink(String poLink)
	{
		this.poLink = poLink;
	}
	public int getPoQty()
	{
		return poQty;
	}
	public void setPoQty(int poQty)
	{
		this.poQty = poQty;
	}
	public String getPoRComment()
	{
		return poRComment;
	}
	public void setPoRComment(String poRComment)
	{
		this.poRComment = poRComment;
	}
	public String getPoZipcode()
	{
		return poZipcode;
	}
	public void setPoZipcode(String poZipcode)
	{
		this.poZipcode = poZipcode;
	}
	public String getPoAddress1()
	{
		return poAddress1;
	}
	public void setPoAddress1(String poAddress1)
	{
		this.poAddress1 = poAddress1;
	}
	public String getPoAddress2()
	{
		return poAddress2;
	}
	public void setPoAddress2(String poAddress2)
	{
		this.poAddress2 = poAddress2;
	}
	public String getPoDComment()
	{
		return poDComment;
	}
	public void setPoDComment(String poDComment)
	{
		this.poDComment = poDComment;
	}
	public String getPoStatus()
	{
		return poStatus;
	}
	public void setPoStatus(String poStatus)
	{
		this.poStatus = poStatus;
	}
	public double getPoTotalPrice()
	{
		return poTotalPrice;
	}
	public void setPoTotalPrice(double poTotalPrice)
	{
		this.poTotalPrice = poTotalPrice;
	}
	
	public PoDto()
	{
		super();
	}
}
