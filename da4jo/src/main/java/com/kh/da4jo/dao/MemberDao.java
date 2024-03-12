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
				  + "member_id, member_pw, member_name_kor, "
				  + "member_name_eng, member_email, member_contact1, "
				  + "member_contact2, member_birth, member_clearance_id, "
				  + "member_zipcode, member_address1, member_address2 "
				 + ") values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
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
	//회원 상세 조회(아이디)
	public MemberDto selectOne(String memberId) {
		String sql = "select * from member where member_id = ?";
		Object[] data = {memberId};
		List<MemberDto> list = jdbcTemplate.query(sql, memberMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
	//회원 상세 조회(이메일)
	public MemberDto selectEmail(String memberEamil) {
		String sql = "select * from member where member_email = ?";
		Object[] data = {memberEamil};
		List<MemberDto> list = jdbcTemplate.query(sql, memberMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
	//최종로그인 시각 변경
	public boolean updateMemberLoginDate(String memberId) {
		String sql = "update member "
								+ "set member_login_date=sysdate "
								+ "where member_id = ?";
		Object[] data = {memberId};
		return jdbcTemplate.update(sql, data) > 0;
	}
	//회원 본인 정보 수정
	public boolean updateMember(MemberDto memberDto) {
		String sql = "update member set "
				+ "member_name_kor=?, member_name_eng=?, "
				+ "member_email=?, member_contact1=?, "
				+ "member_contact2=?, member_birth=?, "
				+ "member_clearance_id=?, member_zipcode=?,"
				+ "member_address1=?, member_address2=? "
				+ "where member_Id=?";
		Object[] data = {
				memberDto.getMemberNameKor(), memberDto.getMemberNameEng(),
				memberDto.getMemberEmail(), memberDto.getMemberContact1(),
				memberDto.getMemberContact2(), memberDto.getMemberBirth(),
				memberDto.getMemberClearanceId(), memberDto.getMemberZipcode(),
				memberDto.getMemberAddress1(), memberDto.getMemberAddress2(),
				memberDto.getMemberId()
		};
		return jdbcTemplate.update(sql,data) > 0;
	}
	
}
