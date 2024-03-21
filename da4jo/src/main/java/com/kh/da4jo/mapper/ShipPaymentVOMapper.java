package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.vo.ShipPaymentVO;

@Service
public class ShipPaymentVOMapper implements RowMapper<ShipPaymentVO> {

	@Override
	public ShipPaymentVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ShipPaymentVO shipPaymentVO = new ShipPaymentVO();
		
		shipPaymentVO.setShipSvcNo(rs.getInt("SHIPSVC_NO"));
		shipPaymentVO.setShipSvcNameKor(rs.getString("SHIPSVC_NAME_KOR"));
		shipPaymentVO.setShipSvcNameEng(rs.getString("SHIPSVC_NAME_ENG"));
		shipPaymentVO.setShipSvcStatus(rs.getString("SHIPSVC_STATUS"));
		shipPaymentVO.setShipSvcFxRate(rs.getDouble("SHIPSVC_FX_RATE"));
		shipPaymentVO.setShipSvcFx(rs.getDouble("SHIPSVC_FX"));
		shipPaymentVO.setShipSvcItemPriceKrw(rs.getDouble("SHIPSVC_ITEM_PRICE_KRW"));
		shipPaymentVO.setShipSvcItemVat(rs.getDouble("SHIPSVC_ITEM_VAT"));
		shipPaymentVO.setShipSvcServiceFee(rs.getInt("SHIPSVC_SERVICE_FEE"));
		shipPaymentVO.setShipSvcTotalPriceKrw(rs.getInt("SHIPSVC_TOTAL_PRICE_KRW"));
		
		shipPaymentVO.setMemberCredit(rs.getInt("member_credit"));
		shipPaymentVO.setMemberPoint(rs.getInt("member_point"));
		
		return shipPaymentVO;
	}

}
