package com.kh.da4jo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.da4jo.dto.CreditDto;
import com.kh.da4jo.dto.PoDto;
import com.kh.da4jo.mapper.CreditMapper;
import com.kh.da4jo.vo.PageVO;

@Repository
public class CreditDao
{
	@Autowired
	JdbcTemplate jdbcTemplate;
	@Autowired
	CreditMapper creditMapper;
	
	
	//캐쉬 구매 내역 등록
	public void insert(CreditDto creditDto) {
		String sql = "INSERT INTO CREDIT(CREDIT_NO, MEMBER_ID, CREDIT_CHARGE, CREDIT_STATUS) "
				+ "VALUES(?, ?, ?, ?)";
		Object[] datas = { creditDto.getCreditNo(), creditDto.getMemberId(), creditDto.getCreditCharge(), creditDto.getCreditStatus()};
		jdbcTemplate.update(sql, datas);
	}
	//캐쉬 구매 내역 조회
	public List<CreditDto> selectList(String memberId) {
		String sql = "SELECT * FROM CREDIT WHERE MEMBER_ID = ? ORDER BY CREDIT_TIME DESC";
		return jdbcTemplate.query(sql, creditMapper, memberId);
	}
	
	//캐시 상태 변경
	public void updateStatus(String status, int creditNo) {
		String sql = "update credit set credit_status=? where credit_no=?";
		Object[] data = {status, creditNo};
		jdbcTemplate.update(sql, data);
	}
	 
	//카운트 -  credit_status가 '승인 요청'인 경우의 목록/검색 구현
	public int creditCount(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select count(*) from credit where instr(" + pageVO.getColumn() +", ?) > 0 AND CREDIT_STATUS='승인 요청'";
			Object[] data = { pageVO.getKeyword() };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {// 목록
			String sql = "select count(*) from credit where CREDIT_STATUS='승인 요청'";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}
	// 목록 페이징
	public List<CreditDto> selectListByPaging(PageVO pageVO) {
		String sql = "select * from (" 
				+ "select rownum rn, TMP.* from ( " 
					+ "select *"
					+ "from credit "
					+ "order by credit_time desc" 
					+ ")TMP" 
				+ ") where rn between ? and ?";
		Object[] data = { pageVO.getBeginRow(), pageVO.getEndRow() };

		return jdbcTemplate.query(sql, creditMapper, data);
	}
	public List<CreditDto> selectUnapprovedListByPaging(PageVO pageVO) {
		String sql = "select * from (" 
				+ "select rownum rn, TMP.* from ( " 
					+ "select *"
					+ "from credit "
					+ "where credit_status = '승인 요청' "
					+ "order by credit_time desc" 
					+ ")TMP" 
				+ ") where rn between ? and ?";
		Object[] data = { pageVO.getBeginRow(), pageVO.getEndRow() };

		return jdbcTemplate.query(sql, creditMapper, data);
	}
	
	//시퀀스 번호 생성
	public int getSequence() {
		String sql = "select credit_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
}
