package com.kh.da4jo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.da4jo.dto.PoDto;
import com.kh.da4jo.mapper.PoMapper;

@Repository
public class PoDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private PoMapper poMapper;


	// poNo 미리 뽑기
	public int getSequence() {
		String sql = "select po_seq.nextval from dual";
		// jdbcTemplate.queryForObject(구문, 결과자료형);
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	// 주문서 등록
	public void insert(PoDto poDto) {
		String sql = "INSERT INTO PO(PO_NO, PO_CUSTOMER_ID, PO_NAME_KOR, PO_NAME_ENG,"
				+ "	  PO_CLEARANCE_ID, PO_ITEM_ENG_NAME, PO_LINK, PO_QTY, PO_ITEM_OPTION1,"
				+ "	  PO_ITEM_OPTION2, PO_ITEM_OPTION3, PO_CONTACT, PO_ZIPCODE,"
				+ "	  PO_ADDRESS1, PO_ADDRESS2, PO_DCOMMENT, PO_CURRENCY, PO_FX, PO_AGREE ) "
				+ "	  VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] data = { 
				poDto.getPoNo(), poDto.getPoCustomerId(), poDto.getPoNameKor(), poDto.getPoNameEng(),
				poDto.getPoClearanceId(), poDto.getPoItemEngName(), poDto.getPoLink(), poDto.getPoQty(),
				poDto.getPoItemOption1(), poDto.getPoItemOption2(), poDto.getPoItemOption3(), poDto.getPoContact(),
				poDto.getPoZipcode(), poDto.getPoAddress1(), poDto.getPoAddress2(), poDto.getPoDcomment(),
				poDto.getPoCurrency(), poDto.getPoFx(), poDto.getPoAgree() 
				};
		jdbcTemplate.update(sql, data);
	}

	// R(read)

	// U(update)

	// D(delete)

}
