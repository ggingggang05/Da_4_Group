package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.dto.CreditDto;

@Service
public class CreditMapper implements RowMapper<CreditDto>
{

	@Override
	public CreditDto mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		CreditDto creditDto = new CreditDto();
		creditDto.setMemberId(rs.getString("MEMBER_ID"));
		creditDto.setCreditCharge(rs.getInt("CREDIT_CHARGE"));
		creditDto.setCreditTimeDate(rs.getDate("CREDIT_TIME"));
		creditDto.setCreditStatus(rs.getString("CREDIT_STATUS"));
		return creditDto;
	}

}
