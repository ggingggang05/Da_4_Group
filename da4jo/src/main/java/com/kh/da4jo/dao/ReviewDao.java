package com.kh.da4jo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.kh.da4jo.dto.ReviewDto;
import com.kh.da4jo.mapper.ReviewMapper;

@Repository
public class ReviewDao {
	@Autowired 
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private ReviewMapper reviewMapper;
	
	//시퀀스
	public int getSequence() {
		String sql = "select review_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	//작성
	public void insert(ReviewDto reviewDto) {
		String sql = "";
		Object[] data = {};
		jdbcTemplate.update(sql, data);
		
	}
	
	//목록
	public List<ReviewDto> selectList() {
		String sql = "";
		Object[] data = {};
		return jdbcTemplate.query(sql, reviewMapper);
		
	}
	
	//검색
	public List<ReviewDto> selectList(String column, String keyword) {
		String sql = "";
		Object[] data = {};
		return jdbcTemplate.query(sql, reviewMapper, data);
	}
	
	//수정
	public boolean update(ReviewDto reviewDto) {
		String sql = "";
		Object[] data = {};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	//삭제
	public boolean delete(int reviewNo) {
		String sql = "";
		Object[] data = {reviewNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	
}
