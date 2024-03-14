package com.kh.da4jo.dto;

import java.sql.Date;

public class PoDto{
	
	private int poNo;
	private String poCustomerId; // 이용자 아이디 멤버외래키
	private String poNameKor; // 주문자 한국이름(한국통관시필요)
	private String poNameEng; // 주문자 영문이름(해외배송때필요)
	private String poClearanceId; // 개인통관번호
	private String poItemEngName; // 상품영문이름(통관시필요)
	private String poLink; // 상품링크
	private int poQty; // 상품수량 디폴트1
	private String poItemOption1; // 상품옵션(사이즈)
	private String poItemOption2; // 상품옵션(색상)
	private String poItemOption3; // 기타 상품에대한 코멘트
	private String poContact; // 휴대전화
	private String poZipcode; // 우편번호
	private String poAddress1; // 기본주소
	private String poAddress2; // 상제주소
	private String poDcomment; // 배송당부사항
	private String poStatus; // 주문상태
	private String poAwbNumber; // 송장번호
	private Date poSdate; // 주문서 작성시각
	private Date poEdate; // 배송완료 시각
	private String poCurrency; // 통화
	private double poFxRate; // 환율
	private double poFx; // 외화금액
	private double poTotalPrice; // 원화금액
	private String poAgree; // 약관동의
	
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
	public String getPoNameEng() {
		return poNameEng;
	}
	public void setPoNameEng(String poNameEng) {
		this.poNameEng = poNameEng;
	}
	public String getPoClearanceId() {
		return poClearanceId;
	}
	public void setPoClearanceId(String poClearanceId) {
		this.poClearanceId = poClearanceId;
	}
	public String getPoItemEngName() {
		return poItemEngName;
	}
	public void setPoItemEngName(String poItemEngName) {
		this.poItemEngName = poItemEngName;
	}
	public String getPoLink() {
		return poLink;
	}
	public void setPoLink(String poLink) {
		this.poLink = poLink;
	}
	public int getPoQty() {
		return poQty;
	}
	public void setPoQty(int poQty) {
		this.poQty = poQty;
	}
	public String getPoItemOption1() {
		return poItemOption1;
	}
	public void setPoItemOption1(String poItemOption1) {
		this.poItemOption1 = poItemOption1;
	}
	public String getPoItemOption2() {
		return poItemOption2;
	}
	public void setPoItemOption2(String poItemOption2) {
		this.poItemOption2 = poItemOption2;
	}
	public String getPoItemOption3() {
		return poItemOption3;
	}
	public void setPoItemOption3(String poItemOption3) {
		this.poItemOption3 = poItemOption3;
	}
	public String getPoContact() {
		return poContact;
	}
	public void setPoContact(String poContact) {
		this.poContact = poContact;
	}
	public String getPoZipcode() {
		return poZipcode;
	}
	public void setPoZipcode(String poZipcode) {
		this.poZipcode = poZipcode;
	}
	public String getPoAddress1() {
		return poAddress1;
	}
	public void setPoAddress1(String poAddress1) {
		this.poAddress1 = poAddress1;
	}
	public String getPoAddress2() {
		return poAddress2;
	}
	public void setPoAddress2(String poAddress2) {
		this.poAddress2 = poAddress2;
	}
	public String getPoDcomment() {
		return poDcomment;
	}
	public void setPoDcomment(String poDcomment) {
		this.poDcomment = poDcomment;
	}
	public String getPoStatus() {
		return poStatus;
	}
	public void setPoStatus(String poStatus) {
		this.poStatus = poStatus;
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
	public Date getPoEdate() {
		return poEdate;
	}
	public void setPoEdate(Date poEdate) {
		this.poEdate = poEdate;
	}
	public String getPoCurrency() {
		return poCurrency;
	}
	public void setPoCurrency(String poCurrency) {
		this.poCurrency = poCurrency;
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
	public double getPoTotalPrice() {
		return poTotalPrice;
	}
	public void setPoTotalPrice(double poTotalPrice) {
		this.poTotalPrice = poTotalPrice;
	}
	public String getPoAgree() {
		return poAgree;
	}
	public void setPoAgree(String poAgree) {
		this.poAgree = poAgree;
	}

	public PoDto() {
		super();
	}
}
