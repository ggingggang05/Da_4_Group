package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.vo.BlockMemberVO;

@Service
public class BlockMemberVOMapper implements RowMapper<BlockMemberVO>
{

	@Override
	public BlockMemberVO mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		BlockMemberVO blockMemberVO = new BlockMemberVO();
		blockMemberVO.setMemberId(rs.getString("MEMBER_ID"));
		blockMemberVO.setMemberNameKor(rs.getString("MEMBER_NAME_KOR"));
		blockMemberVO.setBlockStatus(rs.getString("BLOCK_STATUS"));
		blockMemberVO.setBlockTimeDate(rs.getDate("BLOCK_TIME"));
		blockMemberVO.setBlockReason(rs.getString("BLOCK_REASON"));
		return blockMemberVO;
	}

}
