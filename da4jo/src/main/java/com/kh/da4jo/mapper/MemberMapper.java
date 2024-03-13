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
		memberDto.setMemberId(rs.getString("member_id"));
		memberDto.setMemberPw(rs.getString("member_pw"));
		memberDto.setMemberNameKor(rs.getString("member_name_kor"));
		memberDto.setMemberNameEng(rs.getString("member_name_eng"));
		memberDto.setMemberEmail(rs.getString("member_email"));
		memberDto.setMemberContact1(rs.getString("member_contact1"));
		memberDto.setMemberContact2(rs.getString("member_contact2"));
		memberDto.setMemberBirth(rs.getString("member_birth"));
		memberDto.setMemberClearanceId(rs.getString("member_clearance_id"));
		memberDto.setMemberZipcode(rs.getString("member_zipcode"));
		memberDto.setMemberAddress1(rs.getString("member_address1"));
		memberDto.setMemberAddress2(rs.getString("member_address2"));
		memberDto.setMemberLevel(rs.getString("member_level"));
		memberDto.setMemberJoinDate(rs.getDate("member_join_date"));
		memberDto.setMemberLoginDate(rs.getDate("member_login_date"));
		memberDto.setMemberCredit(rs.getInt("member_credit"));
		memberDto.setMemberPoint(rs.getInt("member_point"));
		memberDto.setMemberBlock(rs.getString("member_block"));
		return memberDto;
	}
}
