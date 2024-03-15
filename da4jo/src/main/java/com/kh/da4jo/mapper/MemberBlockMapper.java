package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.dto.MemberBlockDto;

@Service
public class MemberBlockMapper implements RowMapper<MemberBlockDto>
{

	@Override
	public MemberBlockDto mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		MemberBlockDto memberBlockDto = new MemberBlockDto();
		memberBlockDto.setBlockNo(rs.getInt("BLOCK_NO"));
		memberBlockDto.setBlockMemberId(rs.getString("BLOCK_MEMBER_ID"));
		memberBlockDto.setBlockTimeDate(rs.getDate("BLOCK_TIME"));
		memberBlockDto.setBlockStatus(rs.getString("BLOCK_STATUS"));
		memberBlockDto.setBlockReason(rs.getString("BLOCK_REASON"));
		return memberBlockDto;
	}

}
