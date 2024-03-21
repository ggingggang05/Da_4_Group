package com.kh.da4jo.vo;

import java.sql.Date;

import org.springframework.stereotype.Service;

@Service
public class ShipPaymentVO {
	private int shipSvcNo;
	private String shipSvcNameKor;
	private String shipSvcNameEng;
	private String shipSvcStatus; // 주문상태
	private double shipSvcFxRate; // 환율
	private double shipSvcFx; // 외화금액
	private double shipSvcItemPriceKrw; //환율을 적용한 상품 원화 금액
	private double shipSvcItemVat; // 상품에대한 부가세
	private int shipSvcServiceFee; // 구매대행 이용료
	private int shipSvcTotalPriceKrw; // 원화금액
	private Date shipSvcPayDate; // 결제완료 시각
	
	private int memberCredit; //회원 캐시
	private int memberPoint; //회원 포인트
	
	public ShipPaymentVO() {
		super();
	}

	public int getShipSvcNo() {
		return shipSvcNo;
	}

	public void setShipSvcNo(int shipSvcNo) {
		this.shipSvcNo = shipSvcNo;
	}

	public String getShipSvcNameKor() {
		return shipSvcNameKor;
	}

	public void setShipSvcNameKor(String shipSvcNameKor) {
		this.shipSvcNameKor = shipSvcNameKor;
	}

	public String getShipSvcNameEng() {
		return shipSvcNameEng;
	}

	public void setShipSvcNameEng(String shipSvcNameEng) {
		this.shipSvcNameEng = shipSvcNameEng;
	}

	public String getShipSvcStatus() {
		return shipSvcStatus;
	}

	public void setShipSvcStatus(String shipSvcStatus) {
		this.shipSvcStatus = shipSvcStatus;
	}

	public double getShipSvcFxRate() {
		return shipSvcFxRate;
	}

	public void setShipSvcFxRate(double shipSvcFxRate) {
		this.shipSvcFxRate = shipSvcFxRate;
	}

	public double getShipSvcFx() {
		return shipSvcFx;
	}

	public void setShipSvcFx(double shipSvcFx) {
		this.shipSvcFx = shipSvcFx;
	}

	public double getShipSvcItemPriceKrw() {
		return shipSvcItemPriceKrw;
	}

	public void setShipSvcItemPriceKrw(double shipSvcItemPriceKrw) {
		this.shipSvcItemPriceKrw = shipSvcItemPriceKrw;
	}

	public double getShipSvcItemVat() {
		return shipSvcItemVat;
	}

	public void setShipSvcItemVat(double shipSvcItemVat) {
		this.shipSvcItemVat = shipSvcItemVat;
	}

	public int getShipSvcServiceFee() {
		return shipSvcServiceFee;
	}

	public void setShipSvcServiceFee(int shipSvcServiceFee) {
		this.shipSvcServiceFee = shipSvcServiceFee;
	}

	public int getShipSvcTotalPriceKrw() {
		return shipSvcTotalPriceKrw;
	}

	public void setShipSvcTotalPriceKrw(int shipSvcTotalPriceKrw) {
		this.shipSvcTotalPriceKrw = shipSvcTotalPriceKrw;
	}

	public Date getShipSvcPayDate() {
		return shipSvcPayDate;
	}

	public void setShipSvcPayDate(Date shipSvcPayDate) {
		this.shipSvcPayDate = shipSvcPayDate;
	}

	public int getMemberCredit() {
		return memberCredit;
	}

	public void setMemberCredit(int memberCredit) {
		this.memberCredit = memberCredit;
	}

	public int getMemberPoint() {
		return memberPoint;
	}

	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	
	
	
}
