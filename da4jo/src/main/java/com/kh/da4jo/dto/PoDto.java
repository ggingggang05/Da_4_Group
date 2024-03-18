package com.kh.da4jo.dto;

import java.sql.Date;

import org.apache.logging.log4j.status.StatusData;

public class PoDto {

	private int poNo;
	private String poCustomerId; // 이용자 아이디 멤버외래키
	private String poNameKor; // 주문자 한국이름(한국통관시필요)
	private String poNameEng; // 주문자 영문이름(해외배송때필요)
	private String poClearanceId; // 개인통관번호
	private String poLink; // 상품링크
	private String poItemEngName; // 상품영문이름(통관시필요)
	private String poItemCategory; // 상품카테고리(화장품, 완구, 가방 등)
	private double poItemWeight; // 상품 무게
	private int poQty; // 상품수량 디폴트1
	private String poItemOption1; // 상품옵션(사이즈)
	private String poItemOption2; // 상품옵션(색상)
	private String poItemOption3; // 기타 상품에대한 코멘트
	private String poContact; // 휴대전화
	private String poZipcode; // 우편번호
	private String poAddress1; // 기본주소
	private String poAddress2; // 상제주소
	private String poDcomment; // 배송당부사항
	private String poAdminComment;
	private String poStatus; // 주문상태
	private String poAwbNumber; // 송장번호
	private Date poSdate; // 주문서 작성시각
	private Date poEdate; // 배송완료 시각
	private Date poPayDate; // 결제완료 시각
	private String poCountry; // 국가
	private String poCurrency; // 통화
	private double poFxRate; // 환율
	private double poFx; // 외화금액
	private double poItemPriceKrw; //환율을 적용한 상품 원화 금액
	private double poItemVat; // 상품에대한 부가세
	private int poServiceFee; // 구매대행 이용료
	private int poTotalPriceKrw; // 원화금액
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
	public String getPoLink() {
		return poLink;
	}
	public void setPoLink(String poLink) {
		this.poLink = poLink;
	}
	public String getPoItemEngName() {
		return poItemEngName;
	}
	public void setPoItemEngName(String poItemEngName) {
		this.poItemEngName = poItemEngName;
	}
	public String getPoItemCategory() {
		return poItemCategory;
	}
	public void setPoItemCategory(String poItemCategory) {
		this.poItemCategory = poItemCategory;
	}
	public double getPoItemWeight() {
		return poItemWeight;
	}

	public void setPoItemWeight(double poItemWeight) {
		this.poItemWeight = poItemWeight;
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

	public String getPoCountry() {
		return poCountry;
	}

	public void setPoCountry(String poCountry) {
		this.poCountry = poCountry;
	}

	public String getPoCurrency() {
		return poCurrency;
	}

	public void setPoCurrency(String poCurrency) {
		this.poCurrency = poCurrency;
	}
//	poFxRate 를 poCurrency상태에 맞게 설정 환율 API로 데일리 정보도 받아 올 수 있지만 시간이...
//	만약 poCurrency가 usd 라면 1340 원 
//	만약 poCurrency가 jpy 라면 9 원
//	만약 poCurrency가 eur 라면 1460 원
//	만약 poCurrency가 aud 라면 890 원
//	만약 poCurrency가 gbp 라면 1700 원
//	만약 poCurrency가 cny 라면 190 원
	public double getPoFxRate() {
		if(poCurrency.equals("USD")) {
			return 1340;
		}
		if(poCurrency.equals("JPY")) {
			return 9;
		}
		if(poCurrency.equals("EUR")) {
			return 1460;
		}
		if(poCurrency.equals("AUD")) {
			return 890;
		}
		if(poCurrency.equals("GBP")) {
			return 1700;
		}
		if(poCurrency.equals("CNY")) {
			return 190;
		}
		else {
			return 1;
		}
		
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
	public String getPoAgree() {
		return poAgree;
	}
	public void setPoAgree(String poAgree) {
		this.poAgree = poAgree;
	}

	public String getPoAdminComment() {
		return poAdminComment;
	}
	public void setPoAdminComment(String poAdminComment) {
		this.poAdminComment = poAdminComment;
	}
	public Date getPoPayDate() {
		return poPayDate;
	}
	public void setPoPayDate(Date poPayDate) {
		this.poPayDate = poPayDate;
	}
	/* 가상의 변수를 만들어서 금액 계산해줘야함
	poItemPriceKrw(상품금액)
	poItemVat(부가세)
	poServiceFee(결제수수료)
	poTotalPriceKrw(총결제금액)
	
	poFx * poFxRate = poItemPriceKrw 상품금액
	--
	만약 부가세가 20만원이 넘으면 계산값을 보여주게
	poItemPriceKrw * 0.1 = poItemVat
	--
	(getItemPrice() * 0.05) + 10000 = poServiceFee
	수수료는 결제금액의 5%+1만원
	--
	poItemPriceKrw + poItemVat + poServiceFee = poTotalPriceKrw
	총 결제금액
	*/
	public double getItemPrice() {
		return poFx*getPoFxRate()*poQty;
	}// 원화금액 계산 환율이랑 외화 곱해서
	public double getVat() {
		return  poItemPriceKrw*0.1;
	}
	public int getFee() {
		return (int)((getItemPrice()*0.05)+10000);
	}
	public int getTotalPrice() {
		return (int)(getItemPrice()+getVat()+getFee());
	}
	
	public PoDto() {
		super();
	}
	@Override
	public String toString() {
		return "PoDto [poNo=" + poNo + ", poCustomerId=" + poCustomerId + ", poNameKor=" + poNameKor + ", poNameEng="
				+ poNameEng + ", poClearanceId=" + poClearanceId + ", poLink=" + poLink + ", poItemEngName="
				+ poItemEngName + ", poItemCategory=" + poItemCategory + ", poItemWeight=" + poItemWeight + ", poQty="
				+ poQty + ", poItemOption1=" + poItemOption1 + ", poItemOption2=" + poItemOption2 + ", poItemOption3="
				+ poItemOption3 + ", poContact=" + poContact + ", poZipcode=" + poZipcode + ", poAddress1=" + poAddress1
				+ ", poAddress2=" + poAddress2 + ", poDcomment=" + poDcomment + ", poStatus=" + poStatus
				+ ", poAwbNumber=" + poAwbNumber + ", poSdate=" + poSdate + ", poEdate=" + poEdate + ", poCountry="
				+ poCountry + ", poCurrency=" + poCurrency + ", poFxRate=" + poFxRate + ", poFx=" + poFx
				+ ", poItemPriceKrw=" + poItemPriceKrw + ", poItemVat=" + poItemVat + ", poServiceFee=" + poServiceFee
				+ ", poTotalPriceKrw=" + poTotalPriceKrw + ", poAgree=" + poAgree + "]";
	}
}
