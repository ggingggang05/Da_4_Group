package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.dto.PoDto;
import com.kh.da4jo.dto.QnaDto;

@Service
public class QnaListMapper implements RowMapper<QnaDto>{

	@Override
	public QnaDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		QnaDto qnaDto = new QnaDto();
		qnaDto.setQnaNo(rs.getInt("QNA_NO"));
		qnaDto.setQnaSecreat(rs.getString("QNA_SECREAT"));
		qnaDto.setQnaTitle(rs.getString("QNA_TITLE"));
		qnaDto.setQnaWdate(rs.getDate("QNA_WDATE"));
		return qnaDto;
	}

}
