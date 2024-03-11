package com.kh.da4jo.mapper;



import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.dto.MemberDto;

@Service
public class MemberMapper implements RowMapper<MemberDto>{

	@Override
	public MemberDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		MemberDto memberDto = new MemberDto();
		memberDto.setMemberNo(rs.getInt("member_no"));
		memberDto.setMemberId(rs.getString("member_id"));
		memberDto.setMemberPw(rs.getString("member_pw"));
		memberDto.setMemberNameKor(rs.getString("member_name_kor"));
		memberDto.setMemberNameEng(rs.getString("member_name_eng"));
		memberDto.setMemberContact1(rs.getString("member_contact1"));
		memberDto.setMemberContact2(rs.getString("member_contact2"));
		memberDto.setMemberBirth(rs.getDate("member_birth"));
		return memberDto;
	}

}
