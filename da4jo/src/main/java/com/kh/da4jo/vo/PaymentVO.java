package com.kh.da4jo.vo;

import java.sql.Date;

import org.springframework.stereotype.Service;

@Service
public class PaymentVO {
	private int poNo;
	private String poNameKor;
	private String poNameEng;
	private String poStatus; // 주문상태
	private double poFxRate; // 환율
	private double poFx; // 외화금액
	private double poItemPriceKrw; //환율을 적용한 상품 원화 금액
	private double poItemVat; // 상품에대한 부가세
	private int poServiceFee; // 구매대행 이용료
	private int poTotalPriceKrw; // 원화금액
	private Date poPayDate; // 결제완료 시각
	
	private int memberCredit; //회원 캐시
	private int memberPoint; //회원 포인트
	
	//생성자
	public PaymentVO() {
		super();
	}
	//Getter&Setter
	public int getPoNo() {
		return poNo;
	}

	public void setPoNo(int poNo) {
		this.poNo = poNo;
	}
	
	public String getPoNameKor() {
		return poNameKor;
	}
	public void setPoNameKor(String poNameKor) {
		this.poNameKor = poNameKor;
	}
	public String getPoNameEng() {
		return poNameEng;
	}
	public void setPoNameEng(String poNameEng) {
		this.poNameEng = poNameEng;
	}
	
	public String getPoStatus() {
		return poStatus;
	}

	public void setPoStatus(String poStatus) {
		this.poStatus = poStatus;
	}

	public double getPoFxRate() {
		return poFxRate;
	}

	public void setPoFxRate(double poFxRate) {
		this.poFxRate = poFxRate;
	}

	public double getPoFx() {
		return poFx;
	}

	public void setPoFx(double poFx) {
		this.poFx = poFx;
	}

	public double getPoItemPriceKrw() {
		return poItemPriceKrw;
	}

	public void setPoItemPriceKrw(double poItemPriceKrw) {
		this.poItemPriceKrw = poItemPriceKrw;
	}

	public double getPoItemVat() {
		return poItemVat;
	}

	public void setPoItemVat(double poItemVat) {
		this.poItemVat = poItemVat;
	}

	public int getPoServiceFee() {
		return poServiceFee;
	}

	public void setPoServiceFee(int poServiceFee) {
		this.poServiceFee = poServiceFee;
	}

	public int getPoTotalPriceKrw() {
		return poTotalPriceKrw;
	}

	public void setPoTotalPriceKrw(int poTotalPriceKrw) {
		this.poTotalPriceKrw = poTotalPriceKrw;
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
	public Date getPoPayDate() {
		return poPayDate;
	}
	public void setPoPayDate(Date poPayDate) {
		this.poPayDate = poPayDate;
	}
	
	
}
