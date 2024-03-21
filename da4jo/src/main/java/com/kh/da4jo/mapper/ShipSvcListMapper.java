package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.dto.ShipSvcDto;

@Service
public class ShipSvcListMapper implements RowMapper<ShipSvcDto> {

	public ShipSvcDto mapRow(ResultSet rs, int rowNum) throws SQLException{
		ShipSvcDto shipSvcDto = new ShipSvcDto();
		shipSvcDto.setShipSvcNo(rs.getInt("SHIPSVC_NO"));
		shipSvcDto.setShipSvcItemEngName(rs.getString("SHIPSVC_ITEM_ENG_NAME"));
		shipSvcDto.setShipSvcItemCategory(rs.getString("SHIPSVC_ITEM_CATEGORY"));
		shipSvcDto.setShipSvcStatus(rs.getString("SHIPSVC_STATUS"));
		shipSvcDto.setShipSvcAwbNumber(rs.getString("SHIPSVC_AWB_NUMBER"));
		shipSvcDto.setShipSvcSDate(rs.getDate("SHIPSVC_SDATE"));
		shipSvcDto.setShipSvcFx(rs.getDouble("SHIPSVC_FX"));
		shipSvcDto.setShipSvcServiceFee(rs.getInt("SHIPSVC_SERVICE_FEE"));
		shipSvcDto.setShipSvcItemPriceKrw(rs.getDouble("SHIPSVC_ITEM_PRICE_KRW"));
		shipSvcDto.setShipSvcTotalPriceKrw(rs.getInt("SHIPSVC_TOTAL_PRICE_KRW"));
		
		return shipSvcDto;
	}
}
