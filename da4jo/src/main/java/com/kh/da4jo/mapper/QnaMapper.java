package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import com.kh.da4jo.dto.QnaDto;

@Service
public class QnaMapper implements RowMapper<QnaDto>{

	@Override
	public QnaDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		QnaDto qnaDto = new QnaDto();
		qnaDto.setQnaNo(rs.getInt("qna_no"));
		qnaDto.setQnaSecret(rs.getString("qna_secret"));
		qnaDto.setQnaTitle(rs.getString("qna_title"));
		qnaDto.setQnaContent(rs.getString("qna_content"));
		qnaDto.setQnaWriter(rs.getString("qna_writer"));
		qnaDto.setQnaWdate(rs.getDate("qna_wdate"));
		qnaDto.setQnaVcount(rs.getInt("qna_vcount"));
		qnaDto.setQnaGroup(rs.getInt("qna_group"));
		qnaDto.setQnaTarget(rs.getInt("qna_target"));
		
		return qnaDto;
	}

}
