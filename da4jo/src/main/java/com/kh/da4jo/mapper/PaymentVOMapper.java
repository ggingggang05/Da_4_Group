package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.vo.PaymentVO;

@Service
public class PaymentVOMapper implements RowMapper<PaymentVO>{

	@Override
	public PaymentVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		PaymentVO paymentVO = new PaymentVO();
		
		paymentVO.setPoNo(rs.getInt("PO_NO"));
		paymentVO.setPoNameKor(rs.getString("PO_NAME_KOR"));
		paymentVO.setPoNameEng(rs.getString("PO_NAME_ENG"));
		paymentVO.setPoStatus(rs.getString("PO_STATUS"));
		paymentVO.setPoFxRate(rs.getDouble("PO_FX_RATE"));
		paymentVO.setPoFx(rs.getDouble("PO_FX"));
		paymentVO.setPoItemPriceKrw(rs.getDouble("PO_ITEM_PRICE_KRW"));
		paymentVO.setPoItemVat(rs.getDouble("PO_ITEM_VAT"));
		paymentVO.setPoServiceFee(rs.getInt("PO_SERVICE_FEE"));
		paymentVO.setPoTotalPriceKrw(rs.getInt("PO_TOTAL_PRICE_KRW"));
		
		paymentVO.setMemberCredit(rs.getInt("member_credit"));
		paymentVO.setMemberPoint(rs.getInt("member_point"));
		
		return paymentVO;
	}

}
