package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.dto.NoticeDto;

@Service
public class NoticeMapper implements RowMapper<NoticeDto>{

	@Override
	public NoticeDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		NoticeDto noticeDto = new NoticeDto();
		noticeDto.setNoticeNo(rs.getInt("notice_no"));
		noticeDto.setNoticeTitle(rs.getString("notice_title"));
		noticeDto.setNoticeContent(rs.getString("notice_content"));
		noticeDto.setNoticeWriter(rs.getString("notice_writer"));
		noticeDto.setNoticeWdate(rs.getDate("notice_wdate"));
		noticeDto.setNoticeVcount(rs.getInt("notice_vcount"));
		
		return noticeDto;
	}
}
