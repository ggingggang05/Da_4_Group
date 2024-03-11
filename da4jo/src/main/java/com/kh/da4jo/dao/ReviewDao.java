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
		String sql = "insert into review"
						+ "review_no, review_title, review_content, "
						+ "review_writer, review_wdate, review_vcount) "
						+ "values(?, ?, ?, ?, ?)";
		Object[] data = {
				reviewDto.getReviewNo(), reviewDto.getReviewTitle(), 
				reviewDto.getReviewContent(), reviewDto.getReviewWriter(), 
				reviewDto.getReviewWdate(), reviewDto.getReviewVcount()
		};
		jdbcTemplate.update(sql, data);
		
	}
	
	//목록
	public List<ReviewDto> selectList() {
		String sql = "select "
				+ "review_no, review_title, review_content, "
				+ "review_writer, review_wdate, review_vcount "
				+ "from review order by review_no desc";
		return jdbcTemplate.query(sql, reviewMapper);
		
	}
	
	//검색
	public List<ReviewDto> selectList(String column, String keyword) {
		String sql = "select "
				+ "review_no, review_title, review_content, "
				+ "review_writer, review_wdate, review_vcount "
				+ "from review "
				+ "where instr("+column+", ?) > 0 "
				+ "order by review_no desc";
		Object[] data = {keyword};
		return jdbcTemplate.query(sql, reviewMapper, data);
	}
	
	//삭제
	public boolean delete(int reviewNo) {
		String sql = "delete review where review_no = ?";
		Object[] data = {reviewNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	
}