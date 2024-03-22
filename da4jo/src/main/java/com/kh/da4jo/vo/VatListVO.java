package com.kh.da4jo.vo;

public class VatListVO
{
	private String year;
	private String quater;
	private int poVatTotal;
	private int shipsvcVatTotal;
	private int vatTotal;
	
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getQuater() {
		return quater;
	}

	public void setQuater(String quater) {
		this.quater = quater;
	}

	public int getPoVatTotal() {
		return poVatTotal;
	}

	public void setPoVatTotal(int poVatTotal) {
		this.poVatTotal = poVatTotal;
	}

	public int getShipsvcVatTotal() {
		return shipsvcVatTotal;
	}

	public void setShipsvcVatTotal(int shipsvcVatTotal) {
		this.shipsvcVatTotal = shipsvcVatTotal;
	}

	public int getVatTotal() {
		return vatTotal;
	}

	public void setVatTotal(int vatTotal) {
		this.vatTotal = vatTotal;
	}

	public VatListVO()
	{
		super();
	}
}
