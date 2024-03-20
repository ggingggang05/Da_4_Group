package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.vo.VatListVO;

@Service
public class VatListVOMapper implements RowMapper<VatListVO>
{

	@Override
	public VatListVO mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		VatListVO vatListVO = new VatListVO();
		vatListVO.setQuater(rs.getString("QUARTER"));
		vatListVO.setVatTotal(rs.getInt("VAT_TOTAL"));
		return vatListVO;
	}

}
