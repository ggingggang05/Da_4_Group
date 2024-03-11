package com.kh.da4jo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.da4jo.dto.MemberDto;
import com.kh.da4jo.mapper.MemberMapper;

@Repository
public class MemberDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private MemberMapper memberMapper;
	
	//회원 가입(등록)
	public void insert(MemberDto memberDto) {
		String sql = "insert into member(" 
				  + "member_no, member_id, member_pw, member_name_kor, "
				  + "member_name_eng, member_email, member_contact1, "
				  + "member_contact2, member_birth, member_clearance_id, "
				  + "member_zipcode, member_address1, member_address2, "
				 + ") values (member_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		Object[] data = {
				memberDto.getMemberId(), memberDto.getMemberPw(),
				memberDto.getMemberNameKor(), memberDto.getMemberNameEng(),
				memberDto.getMemberEmail(), memberDto.getMemberContact1(),
				memberDto.getMemberContact2(), memberDto.getMemberBirth(),
				memberDto.getMemberClearanceId(), memberDto.getMemberZipcode(),
				memberDto.getMemberAddress1(), memberDto.getMemberAddress2()
		};
		jdbcTemplate.update(sql,data);
	}
	//회원 목록 조회
	public List<MemberDto>selectList(){
		String sql = "select * from member order by member_id asc";
		//Object[] data = {};
		return jdbcTemplate.query(sql, memberMapper);
	}
	//회원 검색 조회
	public List<MemberDto> selectList(String column, String keyword) {
		String sql = "select * from member where instr("+column+", ?) > 0 "
										+ "order by "+column+" asc, member_id asc";
		Object[] data = {keyword};
		return jdbcTemplate.query(sql, memberMapper, data);
	}
	//회원 상세 조회
	public MemberDto selectOne(String memberNo) {
		String sql = "select * from member where member_id = ?";
		Object[] data = {memberNo};
		List<MemberDto> list = jdbcTemplate.query(sql, memberMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
	
	
}
