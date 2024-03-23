package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.dto.ReviewDto;


@Service
public class ReviewMypageList implements RowMapper<ReviewDto>{

	@Override
	public ReviewDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReviewDto reviewDto = new ReviewDto();
		reviewDto.setReviewNo(rs.getInt("review_no"));
		reviewDto.setReviewTitle(rs.getString("review_title"));
		reviewDto.setReviewWriter(rs.getString("review_writer"));
		reviewDto.setReviewWdate(rs.getDate("review_wdate"));
		return reviewDto;
	}
}
