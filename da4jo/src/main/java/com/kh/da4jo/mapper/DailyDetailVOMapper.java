package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.vo.DailyDetailVO;

@Service
public class DailyDetailVOMapper implements RowMapper<DailyDetailVO>{

	@Override
	public DailyDetailVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		DailyDetailVO dailyDetailVO = new DailyDetailVO();
		dailyDetailVO.setPoPayDate(rs.getDate("PO_PAY_DATE"));
		dailyDetailVO.setPoNo(rs.getInt("PO_NO"));
		dailyDetailVO.setPoCustomerId(rs.getString("PO_CUSTOMER_ID"));
		dailyDetailVO.setPoNameKor(rs.getString("PO_NAME_KOR"));
		dailyDetailVO.setPoItemEngName(rs.getString("PO_ITEM_ENG_NAME"));
		dailyDetailVO.setPoTotalPriceKrw(rs.getInt("PO_TOTAL_PRICE_KRW"));
		dailyDetailVO.setPoItemVat(rs.getDouble("PO_ITEM_VAT"));
		dailyDetailVO.setPoQty(rs.getInt("PO_QTY"));
		dailyDetailVO.setPoAwbNumber(rs.getString("PO_AWB_NUMBER"));
		dailyDetailVO.setPoSdate(rs.getDate("PO_SDATE"));
		return dailyDetailVO;
	}

}
