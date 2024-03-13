package com.kh.da4jo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.da4jo.dto.CreditDto;
import com.kh.da4jo.mapper.CreditMapper;

@Repository
public class CreditDao
{
	@Autowired
	JdbcTemplate jdbcTemplate;
	@Autowired
	CreditMapper creditMapper;
	
	//캐쉬 구매 내역 등록
	public void insert(CreditDto creditDto) {
		String sql = "INSERT INTO CREDIT(MEMBER_ID, CREDIT_CHARGE) "
				+ "VALUES(?, ?)";
		Object[] datas = {creditDto.getMemberId(), creditDto.getCreditCharge()};
		jdbcTemplate.update(sql, datas);
	}
	//캐쉬 구매 내역 조회
	public List<CreditDto> selectList(String memberId) {
		String sql = "SELECT * FROM CREDIT WHERE MEMBER_ID = ? ORDER BY CREDIT_TIME DESC";
		return jdbcTemplate.query(sql, creditMapper, memberId);
	}
}
