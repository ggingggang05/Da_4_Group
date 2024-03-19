package com.kh.da4jo.mapper;



import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.vo.SettlementVO;
@Service
public class SettlementVOMapper implements RowMapper<SettlementVO>{

	@Override
	public SettlementVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		SettlementVO settlementVO = new SettlementVO();
		settlementVO.setPoPayDate(rs.getDate("PO_PAY_DATE"));
		settlementVO.setPoTotalPrice(rs.getInt("PO_TOTAL_PRICE_KRW"));
		return settlementVO;
	}

}
