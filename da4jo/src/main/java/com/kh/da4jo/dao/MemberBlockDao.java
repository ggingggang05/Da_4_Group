package com.kh.da4jo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.da4jo.dto.MemberBlockDto;
import com.kh.da4jo.dto.MemberDto;
import com.kh.da4jo.mapper.BlockMemberVOMapper;
import com.kh.da4jo.mapper.MemberBlockMapper;
import com.kh.da4jo.vo.BlockMemberVO;

@Repository
public class MemberBlockDao
{
	@Autowired
	JdbcTemplate jdbcTemplate;
	@Autowired
	MemberBlockMapper memberBlockMapper;
	@Autowired
	private BlockMemberVOMapper blockMemberVOMapper;
	
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
	public List<MemberBlockDto> blockList(String memberId) {
		String sql = "SELECT * FROM MEMBER_BLOCK WHERE BLOCK_MEMBER_ID=?";
		return jdbcTemplate.query(sql, memberBlockMapper, memberId);
	}
	// BLOCK된 아이디 목록 조회
		public List<BlockMemberVO> selectBlockListById() {
			String sql = "SELECT SUB.MEMBER_ID, SUB.MEMBER_NAME_KOR, SUB.BLOCK_STATUS, SUB.BLOCK_TIME, SUB.BLOCK_REASON FROM " +
                    "(SELECT M.MEMBER_ID, M.MEMBER_NAME_KOR, MB.BLOCK_STATUS, MB.BLOCK_TIME, MB.BLOCK_REASON, " +
                    "ROW_NUMBER() OVER (PARTITION BY M.MEMBER_ID ORDER BY MB.BLOCK_TIME DESC) AS ROW_NUM " +
                    "FROM MEMBER M " +
                    "JOIN MEMBER_BLOCK MB ON M.MEMBER_ID = MB.BLOCK_MEMBER_ID " +
                    "WHERE M.MEMBER_BLOCK = 'Y' ) SUB " +
                    "WHERE SUB.ROW_NUM = 1";
			return jdbcTemplate.query(sql, blockMemberVOMapper);
		}
		// BLOCK된 아이디 검색 조회
		public List<BlockMemberVO> selectBlockListById(String memberId)
		{
			String sql = "SELECT SUB.MEMBER_ID, SUB.MEMBER_NAME_KOR, SUB.BLOCK_STATUS, SUB.BLOCK_TIME, SUB.BLOCK_REASON FROM " +
                    "(SELECT M.MEMBER_ID, M.MEMBER_NAME_KOR, MB.BLOCK_STATUS, MB.BLOCK_TIME, MB.BLOCK_REASON, " +
                    "ROW_NUMBER() OVER (PARTITION BY M.MEMBER_ID ORDER BY MB.BLOCK_TIME DESC) AS ROW_NUM " +
                    "FROM MEMBER M " +
                    "JOIN MEMBER_BLOCK MB ON M.MEMBER_ID = MB.BLOCK_MEMBER_ID " +
                    "WHERE M.MEMBER_BLOCK = 'Y' AND INSTR(M.MEMBER_ID, ?) > 0) SUB " +
                    "WHERE SUB.ROW_NUM = 1";
			return jdbcTemplate.query(sql, blockMemberVOMapper, memberId);
		}
	//차단 회원인지 조회
		public MemberBlockDto selectOne(String memberId) {
			String sql = "SELECT * FROM MEMBER_BLOCK WHERE BLOCK_MEMBER_ID = ? ORDER BY BLOCK_TIME DESC";
			List<MemberBlockDto> list = jdbcTemplate.query(sql, memberBlockMapper ,memberId);
			return list.get(0);
		}
}
