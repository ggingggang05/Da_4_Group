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
		poDto.setPoNo(rs.getInt("Po_no"));
		poDto.setPoCustomer(rs.getString("po_customer"));
		poDto.setPoContact(rs.getString("po_contact"));
		poDto.setPoLink(rs.getString("po_link"));
		poDto.setPoQty(rs.getInt("po_qty"));
		poDto.setPoRcomment(rs.getString("po_rcomment"));
		poDto.setPoZipcode(rs.getString("po_zipcode"));
		poDto.setPoAddress1(rs.getString("po_address1"));
		poDto.setPoAddress2(rs.getString("po_address2"));
		poDto.setPoDcomment(rs.getString("po_dcomment"));
		poDto.setPoStatus(rs.getString("po_status"));
		poDto.setPoTotalPrice(rs.getDouble("po_total_price"));
		
		return poDto;
	}
}
