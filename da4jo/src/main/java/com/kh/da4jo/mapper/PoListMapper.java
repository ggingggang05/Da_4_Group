package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.dto.PoDto;

@Service
public class PoListMapper implements RowMapper<PoDto> {

	public PoDto mapRow(ResultSet rs, int rowNum) throws SQLException{
		PoDto poDto = new PoDto();
		poDto.setPoNo(rs.getInt("PO_NO"));
		poDto.setPoItemEngName(rs.getString("PO_ITEM_ENG_NAME"));
		poDto.setPoItemCategory(rs.getString("PO_ITEM_CATEGORY"));
		poDto.setPoStatus(rs.getString("PO_STATUS"));
		poDto.setPoAwbNumber(rs.getString("PO_AWB_NUMBER"));
		poDto.setPoSdate(rs.getDate("PO_SDATE"));
		poDto.setPoFx(rs.getDouble("PO_FX"));
		poDto.setPoServiceFee(rs.getInt("PO_SERVICE_FEE"));
		poDto.setPoTotalPriceKrw(rs.getInt("PO_TOTAL_PRICE_KRW"));
		
		return poDto;
	}
}
