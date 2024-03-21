package com.kh.da4jo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.da4jo.dto.ShipSvcDto;
import com.kh.da4jo.mapper.PaymentVOMapper;
import com.kh.da4jo.mapper.SettlementVOMapper;

@Repository
public class ShipSvcDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private PaymentVOMapper paymentVOMapper;
	@Autowired
	private SettlementVOMapper settlementVOMapper;

	// SHIPSVCNo 미리 뽑기
	public int getSequence() {
		String sql = "select SHIPSVC_SEQ.nextval from dual";
		// jdbcTemplate.queryForObject(구문, 결과자료형);
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	public void insert(ShipSvcDto shipSvcDto) {
		String sql = "INSERT INTO SHIPSVC(SHIPSVC_NO, SHIPSVC_CUSTOMER_ID, SHIPSVC_NAME_KOR, SHIPSVC_NAME_ENG,"
				+ "	  SHIPSVC_CLEARANCE_ID, SHIPSVC_ITEM_ENG_NAME, SHIPSVC_LINK, SHIPSVC_QTY, SHIPSVC_ITEM_OPTION1,"
				+ "	  SHIPSVC_CONTACT, SHIPSVC_ZIPCODE, SHIPSVC_ADDRESS1, SHIPSVC_ADDRESS2, SHIPSVC_DCOMMENT, "
				+ "	  SHIPSVC_COUNTRY, SHIPSVC_CURRENCY, SHIPSVC_FX, SHIPSVC_AGREE,SHIPSVC_USER_SHIPPER,SHIPSVC_USER_AWB_NUMBER ) "
				+ "	  VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] data = {
				shipSvcDto.getShipSvcNo(),shipSvcDto.getShipSvcCustomerId(),shipSvcDto.getShipSvcNameKor(),shipSvcDto.getShipSvcNameEng(),
				shipSvcDto.getShipSvcClearanceId(),shipSvcDto.getShipSvcItemEngName(),shipSvcDto.getShipSvcLink(),shipSvcDto.getShipSvcQty(),
				shipSvcDto.getShipSvcItemOption1(),shipSvcDto.getShipSvcContact(),shipSvcDto.getShipSvcZipcode(),shipSvcDto.getShipSvcAddress1(),
				shipSvcDto.getShipSvcAddress2(),shipSvcDto.getShipSvcDComment(),shipSvcDto.getShipSvcCountry(),shipSvcDto.getShipSvcCurrency(),
				shipSvcDto.getShipSvcFx(),shipSvcDto.getShipSvcAgree(),shipSvcDto.getShipSvcUserShipper(),shipSvcDto.getShipSvcUserAwbNumber()
				
		};
		jdbcTemplate.update(sql, data);
	}

}
