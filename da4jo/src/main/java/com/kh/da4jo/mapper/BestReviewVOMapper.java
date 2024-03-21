package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.vo.BestReviewVO;

@Service
public class BestReviewVOMapper implements RowMapper<BestReviewVO>
{

	@Override
	public BestReviewVO mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		BestReviewVO bestReviewVO = new BestReviewVO();
		bestReviewVO.setReviewNo(rs.getInt("REVIEW_NO"));
		bestReviewVO.setReviewWriter(rs.getString("REVIEW_WRITER"));
		return bestReviewVO;
	}
	
}
