package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.dto.PoDto;

@Service
public class PoMapper implements RowMapper<PoDto>{

	@Override
	public PoDto mapRow(ResultSet rs, int rowNum) throws SQLException{
		PoDto poDto = new PoDto();
		poDto.setPoNo(rs.getInt("PO_NO"));
		poDto.setPoCustomerId(rs.getString("PO_CUSTOMER_ID"));
		poDto.setPoNameKor(rs.getString("PO_NAME_KOR"));
		poDto.setPoNameEng(rs.getString("PO_NAME_ENG"));
		poDto.setPoClearanceId(rs.getString("PO_CLEARANCE_ID"));
		poDto.setPoLink(rs.getString("PO_LINK"));
		poDto.setPoItemEngName(rs.getString("PO_ITEM_ENG_NAME"));
		poDto.setPoItemCategory(rs.getString("PO_ITEM_CATEGORY"));
		poDto.setPoItemWeight(rs.getDouble("PO_ITEM_WEIGHT"));
		poDto.setPoQty(rs.getInt("PO_QTY"));
		poDto.setPoItemOption1(rs.getString("PO_ITEM_OPTION1"));
		poDto.setPoItemOption2(rs.getString("PO_ITEM_OPTION2"));
		poDto.setPoItemOption3(rs.getString("PO_ITEM_OPTION3"));
		poDto.setPoContact(rs.getString("PO_CONTACT"));
		poDto.setPoZipcode(rs.getString("PO_ZIPCODE"));
		poDto.setPoAddress1(rs.getString("PO_ADDRESS1"));
		poDto.setPoAddress2(rs.getString("PO_ADDRESS2"));
		poDto.setPoDcomment(rs.getString("PO_DCOMMENT"));
		poDto.setPoStatus(rs.getString("PO_STATUS"));
		poDto.setPoAwbNumber(rs.getString("PO_AWB_NUMBER"));
		poDto.setPoSdate(rs.getDate("PO_SDATE"));
		poDto.setPoEdate(rs.getDate("PO_EDATE"));
		poDto.setPoCountry(rs.getString("PO_COUNTRY"));
		poDto.setPoCurrency(rs.getString("PO_CURRENCY"));
		poDto.setPoFxRate(rs.getDouble("PO_FX_RATE"));
		poDto.setPoFx(rs.getDouble("PO_FX"));
		poDto.setPoItemPriceKrw(rs.getDouble("PO_ITEM_PRICE_KRW"));
		poDto.setPoItemVat(rs.getDouble("PO_ITEM_VAT"));
		poDto.setPoServiceFee(rs.getInt("PO_SERVICE_FEE"));
		poDto.setPoTotalPriceKrw(rs.getInt("PO_TOTAL_PRICE_KRW"));
		poDto.setPoAgree(rs.getString("PO_AGREE"));
		
		return poDto;
	}
}
