package com.kh.da4jo.dto;
import java.util.Date;

public class ShipSvcDto {
				
	private int shipSvcNo;
	private String shipSvcCustomerId; // 이용자 아이디 멤버외래키
	private String shipSvcNameKor; // 주문자 한국이름(한국통관시필요)
	private String shipSvcNameEng; // 주문자 영문이름(해외배송때필요)일치하는지 확인차
	private String shipSvcClearanceId; // 개인통관번호
	private String shipSvcLink; // 상품링크
	private String shipSvcItemEngName; // 상품영문이름(통관시필요)
	private String shipSvcItemCategory; // 상품카테고리(화장품, 완구, 가방 등)
	private double shipSvcItemWeight; // 택배상자 무게
	private int shipSvcQty; // 상품수량 디폴트1
	private String shipSvcItemOption1; // 남길 말
	private String shipSvcContact; // 휴대전화
	private String shipSvcZipcode; // 우편번호
	private String shipSvcAddress1; // 기본주소
	private String shipSvcAddress2; // 상제주소
	private String shipSvcDComment; // 배송당부사항
	private String shipSvcClaim; // 고객이 뭐 금액 컴플걸때 무게 다시 재달라고 할수있으니까
	private String shipSvcAdminComment; // 관리자가 안내할말
	private String shipSvcStatus; // 주문상태
	private String shipSvcAwbNumber; // 송장번호(배송대행 다사조입력)
	private String shipSvcShipper; // 배송회사(배송대행 다사조입력)
	private String shipSvcUserAwbNumber; // 송장번호(구매자가 아마존, 라쿠텐 등에서 받은) 배송대행신청시 필수입력
	private String shipSvcUserShipper; // 배송회사(구매자가 아마존, 라쿠텐 등에서 받은) 배송대행신청시 필수입력
	private Date shipSvcSDate; // 주문서 작성시각
	private Date shipSvcEDate; // 배송완료 시각
	private Date shipSvcPayDate; // 결제완료 시각
	private Date shipSvcShipDate; // 배송시작 시각(배송대행 다사조입력)
	private Date shipSvcUserShipDate; // 배송시작 시각(구매자가 아마존,등에서 배송시작된 시각)
	private String shipSvcCountry; // 국가
	private String shipSvcCurrency; // 통화
	private double shipSvcFxRate; // 환율
	private double shipSvcFx; // 외화금액
	private double shipSvcItemPriceKrw; // 환율을 적용한 상품 원화 금액
	private double shipSvcItemVat; // 상품에대한 부가세
	private int shipSvcServiceFee; // 구매대행 이용료
	private int shipSvcTotalPriceKrw; // 원화금액
	private String shipSvcAgree; // 약관동의
	public int getShipSvcNo() {
		return shipSvcNo;
	}
	public void setShipSvcNo(int shipSvcNo) {
		this.shipSvcNo = shipSvcNo;
	}
	public String getShipSvcCustomerId() {
		return shipSvcCustomerId;
	}
	public void setShipSvcCustomerId(String shipSvcCustomerId) {
		this.shipSvcCustomerId = shipSvcCustomerId;
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
	public String getShipSvcClearanceId() {
		return shipSvcClearanceId;
	}
	public void setShipSvcClearanceId(String shipSvcClearanceId) {
		this.shipSvcClearanceId = shipSvcClearanceId;
	}
	public String getShipSvcLink() {
		return shipSvcLink;
	}
	public void setShipSvcLink(String shipSvcLink) {
		this.shipSvcLink = shipSvcLink;
	}
	public String getShipSvcItemEngName() {
		return shipSvcItemEngName;
	}
	public void setShipSvcItemEngName(String shipSvcItemEngName) {
		this.shipSvcItemEngName = shipSvcItemEngName;
	}
	public String getShipSvcItemCategory() {
		return shipSvcItemCategory;
	}
	public void setShipSvcItemCategory(String shipSvcItemCategory) {
		this.shipSvcItemCategory = shipSvcItemCategory;
	}
	public double getShipSvcItemWeight() {
		return shipSvcItemWeight;
	}
	public void setShipSvcItemWeight(double shipSvcItemWeight) {
		this.shipSvcItemWeight = shipSvcItemWeight;
	}
	public int getShipSvcQty() {
		return shipSvcQty;
	}
	public void setShipSvcQty(int shipSvcQty) {
		this.shipSvcQty = shipSvcQty;
	}
	public String getShipSvcItemOption1() {
		return shipSvcItemOption1;
	}
	public void setShipSvcItemOption1(String shipSvcItemOption1) {
		this.shipSvcItemOption1 = shipSvcItemOption1;
	}
	public String getShipSvcContact() {
		return shipSvcContact;
	}
	public void setShipSvcContact(String shipSvcContact) {
		this.shipSvcContact = shipSvcContact;
	}
	public String getShipSvcZipcode() {
		return shipSvcZipcode;
	}
	public void setShipSvcZipcode(String shipSvcZipcode) {
		this.shipSvcZipcode = shipSvcZipcode;
	}
	public String getShipSvcAddress1() {
		return shipSvcAddress1;
	}
	public void setShipSvcAddress1(String shipSvcAddress1) {
		this.shipSvcAddress1 = shipSvcAddress1;
	}
	public String getShipSvcAddress2() {
		return shipSvcAddress2;
	}
	public void setShipSvcAddress2(String shipSvcAddress2) {
		this.shipSvcAddress2 = shipSvcAddress2;
	}
	public String getShipSvcDComment() {
		return shipSvcDComment;
	}
	public void setShipSvcDComment(String shipSvcDComment) {
		this.shipSvcDComment = shipSvcDComment;
	}
	public String getShipSvcClaim() {
		return shipSvcClaim;
	}
	public void setShipSvcClaim(String shipSvcClaim) {
		this.shipSvcClaim = shipSvcClaim;
	}
	public String getShipSvcAdminComment() {
		return shipSvcAdminComment;
	}
	public void setShipSvcAdminComment(String shipSvcAdminComment) {
		this.shipSvcAdminComment = shipSvcAdminComment;
	}
	public String getShipSvcStatus() {
		return shipSvcStatus;
	}
	public void setShipSvcStatus(String shipSvcStatus) {
		this.shipSvcStatus = shipSvcStatus;
	}
	public String getShipSvcAwbNumber() {
		return shipSvcAwbNumber;
	}
	public void setShipSvcAwbNumber(String shipSvcAwbNumber) {
		this.shipSvcAwbNumber = shipSvcAwbNumber;
	}
	public String getShipSvcShipper() {
		return shipSvcShipper;
	}
	public void setShipSvcShipper(String shipSvcShipper) {
		this.shipSvcShipper = shipSvcShipper;
	}
	public String getShipSvcUserAwbNumber() {
		return shipSvcUserAwbNumber;
	}
	public void setShipSvcUserAwbNumber(String shipSvcUserAwbNumber) {
		this.shipSvcUserAwbNumber = shipSvcUserAwbNumber;
	}
	public String getShipSvcUserShipper() {
		return shipSvcUserShipper;
	}
	public void setShipSvcUserShipper(String shipSvcUserShipper) {
		this.shipSvcUserShipper = shipSvcUserShipper;
	}
	public Date getShipSvcSDate() {
		return shipSvcSDate;
	}
	public void setShipSvcSDate(Date shipSvcSDate) {
		this.shipSvcSDate = shipSvcSDate;
	}
	public Date getShipSvcEDate() {
		return shipSvcEDate;
	}
	public void setShipSvcEDate(Date shipSvcEDate) {
		this.shipSvcEDate = shipSvcEDate;
	}
	public Date getShipSvcPayDate() {
		return shipSvcPayDate;
	}
	public void setShipSvcPayDate(Date shipSvcPayDate) {
		this.shipSvcPayDate = shipSvcPayDate;
	}
	public Date getShipSvcShipDate() {
		return shipSvcShipDate;
	}
	public void setShipSvcShipDate(Date shipSvcShipDate) {
		this.shipSvcShipDate = shipSvcShipDate;
	}
	public Date getShipSvcUserShipDate() {
		return shipSvcUserShipDate;
	}
	public void setShipSvcUserShipDate(Date shipSvcUserShipDate) {
		this.shipSvcUserShipDate = shipSvcUserShipDate;
	}
	public String getShipSvcCountry() {
		return shipSvcCountry;
	}
	public void setShipSvcCountry(String shipSvcCountry) {
		this.shipSvcCountry = shipSvcCountry;
	}
	public String getShipSvcCurrency() {
		return shipSvcCurrency;
	}
	public void setShipSvcCurrency(String shipSvcCurrency) {
		this.shipSvcCurrency = shipSvcCurrency;
	}
	// 환율 API 적용 불가로 직접 환율값 설정
	public double getShipSvcFxRate() {
		if("USD".equals(shipSvcCurrency)) {
			return 1340;
		}
		if("JPY".equals(shipSvcCurrency)) {
			return 9;
		}
		if("EUR".equals(shipSvcCurrency)) {
			return 1460;
		}
		if("AUD".equals(shipSvcCurrency)) {
			return 890;
		}
		if("GBP".equals(shipSvcCurrency)) {
			return 1700;
		}
		if("CNY".equals(shipSvcCurrency)) {
			return 190;
		}
		else {
			return 1;
		}
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
	public String getShipSvcAgree() {
		return shipSvcAgree;
	}
	public void setShipSvcAgree(String shipSvcAgree) {
		this.shipSvcAgree = shipSvcAgree;
	}
	/* 가상의 변수를 만들어서 금액 계산해줘야함
	총 결제금액
	1키로그램에 11.2 달러 
	국내배송+통관수수료 =  만원 픽스
	
	
	*/
	public double getItemPrice() {
		return shipSvcFx*getShipSvcFxRate()*shipSvcQty;
	}// 원화금액 계산 환율이랑 외화 곱해서 이건 사용자 측에서 입력해서 관세기준 넘는지 확인 할 수 있을듯 
	// 그리고 위의 원화 금액이 있어야 아래의 VAT 금액이 나옴
	public double getVat() {
		return  getItemPrice()*0.1;
	}
	// 키로그램에 11.2달러인거에 원화로 곱해서 수수료 산출 여기에 + 10000원
	public int getFee(){
		return (int)((shipSvcItemWeight*11.2)*getShipSvcFxRate())+ 10000;
	}
	// 상품가격은 고객이 물건 구매처에서 직접 결제하기때문에 다사줘에 결제 할 금액은 배송대행 수수료와 부가세만 존재
	public int getTotalPrice() {
		return (int)(getVat()+getFee());
	}
	
	
	
	
	
	public ShipSvcDto() {
		super();
	}
	@Override
	public String toString() {
		return "ShipSvcDto [shipSvcNo=" + shipSvcNo + ", shipSvcCustomerId=" + shipSvcCustomerId + ", shipSvcNameKor="
				+ shipSvcNameKor + ", shipSvcNameEng=" + shipSvcNameEng + ", shipSvcClearanceId=" + shipSvcClearanceId
				+ ", shipSvcLink=" + shipSvcLink + ", shipSvcItemEngName=" + shipSvcItemEngName
				+ ", shipSvcItemCategory=" + shipSvcItemCategory + ", shipSvcItemWeight=" + shipSvcItemWeight
				+ ", shipSvcQty=" + shipSvcQty + ", shipSvcItemOption1=" + shipSvcItemOption1 + ", shipSvcContact="
				+ shipSvcContact + ", shipSvcZipcode=" + shipSvcZipcode + ", shipSvcAddress1=" + shipSvcAddress1
				+ ", shipSvcAddress2=" + shipSvcAddress2 + ", shipSvcDComment=" + shipSvcDComment + ", shipSvcClaim="
				+ shipSvcClaim + ", shipSvcAdminComment=" + shipSvcAdminComment + ", shipSvcStatus=" + shipSvcStatus
				+ ", shipSvcAwbNumber=" + shipSvcAwbNumber + ", shipSvcShipper=" + shipSvcShipper
				+ ", shipSvcUserAwbNumber=" + shipSvcUserAwbNumber + ", shipSvcUserShipper=" + shipSvcUserShipper
				+ ", shipSvcSDate=" + shipSvcSDate + ", shipSvcEDate=" + shipSvcEDate + ", shipSvcPayDate="
				+ shipSvcPayDate + ", shipSvcShipDate=" + shipSvcShipDate + ", shipSvcUserShipDate="
				+ shipSvcUserShipDate + ", shipSvcCountry=" + shipSvcCountry + ", shipSvcCurrency=" + shipSvcCurrency
				+ ", shipSvcFxRate=" + shipSvcFxRate + ", shipSvcFx=" + shipSvcFx + ", shipSvcItemPriceKrw="
				+ shipSvcItemPriceKrw + ", shipSvcItemVat=" + shipSvcItemVat + ", shipSvcServiceFee="
				+ shipSvcServiceFee + ", shipSvcTotalPriceKrw=" + shipSvcTotalPriceKrw + ", shipSvcAgree="
				+ shipSvcAgree + "]";
	}
	
}
