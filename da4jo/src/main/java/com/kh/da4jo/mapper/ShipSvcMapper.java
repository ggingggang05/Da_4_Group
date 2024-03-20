package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.dto.ShipSvcDto;

@Service
public class ShipSvcMapper implements RowMapper<ShipSvcDto>{

	@Override
	public ShipSvcDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ShipSvcDto shipSvcDto = new ShipSvcDto();
		shipSvcDto.setShipSvcNo(rs.getInt("SHIPSVC_NO")); // 이용자 아이디 멤버외래키
		shipSvcDto.setShipSvcCustomerId(rs.getString("SHIPSVC_CUSTOMER_ID")); // 이용자 아이디 멤버외래키
		shipSvcDto.setShipSvcNameKor(rs.getString("SHIPSVC_NAME_KOR")); // 주문자 한국이름(한국통관시필요)
		shipSvcDto.setShipSvcNameEng(rs.getString("SHIPSVC_NAME_ENG")); // 주문자 영문이름(해외배송때필요)일치하는지 확인차
		shipSvcDto.setShipSvcClearanceId(rs.getString("SHIPSVC_CLEARANCE_ID"));// 개인통관번호
		shipSvcDto.setShipSvcLink(rs.getString("SHIPSVC_LINK")); // 상품링크
		shipSvcDto.setShipSvcItemEngName(rs.getString("SHIPSVC_ITEM_ENG_NAME")); // 상품영문이름(통관시필요)
		shipSvcDto.setShipSvcItemCategory(rs.getString("SHIPSVC_ITEM_CATEGORY")); // 상품카테고리(화장품, 완구, 가방 등)
		shipSvcDto.setShipSvcItemWeight(rs.getDouble("SHIPSVC_ITEM_WEIGHT")); // 택배상자 무게   
		shipSvcDto.setShipSvcQty(rs.getInt("SHIPSVC_QTY")); // 상품수량 디폴트1
		shipSvcDto.setShipSvcItemOption1(rs.getString("SHIPSVC_ITEM_OPTION1")); // 남길 말
		shipSvcDto.setShipSvcContact(rs.getString("SHIPSVC_CONTACT")); // 휴대전화
		shipSvcDto.setShipSvcZipcode(rs.getString("SHIPSVC_ZIPCODE")); // 우편번호
		shipSvcDto.setShipSvcAddress1(rs.getString("SHIPSVC_ADDRESS1")); // 기본주소
		shipSvcDto.setShipSvcAddress2(rs.getString("SHIPSVC_ADDRESS2")); // 상제주소
		shipSvcDto.setShipSvcDComment(rs.getString("SHIPSVC_DCOMMENT")); // 배송당부사항
		shipSvcDto.setShipSvcClaim(rs.getString("SHIPSVC_CLAIM")); // 고객이 뭐 금액 컴플걸때
		shipSvcDto.setShipSvcAdminComment(rs.getString("SHIPSVC_ADMIN_COMMENT")); // 관리자가 안내할말
		shipSvcDto.setShipSvcStatus(rs.getString("SHIPSVC_STATUS")); // 주문상태
		shipSvcDto.setShipSvcAwbNumber(rs.getString("SHIPSVC_AWB_NUMBER")); // 송장번호(배송대행 다사조입력)
		shipSvcDto.setShipSvcShipper(rs.getString("SHIPSVC_SHIPPER")); // 배송회사(배송대행 다사조입력)
		shipSvcDto.setShipSvcUserAwbNumber(rs.getString("SHIPSVC_USER_AWB_NUMBER")); // 송장번호(구매자가 아마존, 라쿠텐 등에서 받은) 배송대행신청시 필수입력
		shipSvcDto.setShipSvcUserShipper(rs.getString("SHIPSVC_USER_SHIPPER")); // 배송회사(구매자가 아마존, 라쿠텐 등에서 받은) 배송대행신청시 필수입력
		shipSvcDto.setShipSvcSDate(rs.getDate("SHIPSVC_SDATE")); // 주문서 작성시각
		shipSvcDto.setShipSvcEDate(rs.getDate("SHIPSVC_EDATE")); // 배송완료 시각
		shipSvcDto.setShipSvcPayDate(rs.getDate("SHIPSVC_PAY_DATE")); // 결제완료 시각
		shipSvcDto.setShipSvcShipDate(rs.getDate("SHIPSVC_SHIP_DATE")); // 배송시작 시각(배송대행 다사조입력)
		shipSvcDto.setShipSvcUserShipDate(rs.getDate("SHIPSVC_USER_SHIP_DATE")); // 배송시작 시각(구매자가 아마존,등에서 배송시작된 시각)
		shipSvcDto.setShipSvcCountry(rs.getString("SHIPSVC_COUNTRY")); // 국가
		shipSvcDto.setShipSvcCurrency(rs.getString("SHIPSVC_CURRENCY")); // 통화
		shipSvcDto.setShipSvcFxRate(rs.getDouble("SHIPSVC_FX_RATE")); // 환율
		shipSvcDto.setShipSvcFx(rs.getDouble("SHIPSVC_FX")); // 외화금액
		shipSvcDto.setShipSvcItemPriceKrw(rs.getDouble("SHIPSVC_ITEM_PRICE_KRW")); // 환율을 적용한 상품 원화 금액
		shipSvcDto.setShipSvcItemVat(rs.getDouble("SHIPSVC_ITEM_VAT")); // 상품에대한 부가세
		shipSvcDto.setShipSvcServiceFee(rs.getInt("SHIPSVC_SERVICE_FEE")); // 구매대행 이용료
		shipSvcDto.setShipSvcTotalPriceKrw(rs.getInt("SHIPSVC_TOTAL_PRICE_KRW")); // 원화금액
		shipSvcDto.setShipSvcAgree(rs.getString("SHIPSVC_AGREE")); // 약관동의
		
		
		return shipSvcDto;
	}

}
