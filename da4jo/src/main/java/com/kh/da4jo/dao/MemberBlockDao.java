package com.kh.da4jo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.da4jo.dto.MemberBlockDto;
import com.kh.da4jo.dto.MemberDto;
import com.kh.da4jo.mapper.MemberBlockMapper;

@Repository
public class MemberBlockDao
{
	@Autowired
	JdbcTemplate jdbcTemplate;
	@Autowired
	MemberBlockMapper memberBlockMapper;
	
	public void insertMemberBlock(MemberBlockDto memberBlockDto ) {
		String sql = "INSERT INTO MEMBER_BLOCK(BLOCK_NO, BLOCK_MEMBER_ID, BLOCK_STATUS, BLOCK_REASON) "
				+ "VALUES(MEMBER_BLOCK_SEQ.NEXTVAL, ?, ?, ?)";
		Object[] datas = {memberBlockDto.getBlockMemberId(), memberBlockDto.getBlockStatus(), memberBlockDto.getBlockReason()};
		jdbcTemplate.update(sql, datas);
	}
	public void changeMemberStatus(MemberDto memberDto) {
		String sql = "UPDATE MEMBER SET MEMBER_BLOCK=? WHERE MEMBER_ID=?";
		Object[] datas = {memberDto.getMemberBlock(), memberDto.getMemberId()};
		jdbcTemplate.update(sql, datas);
	}
}
