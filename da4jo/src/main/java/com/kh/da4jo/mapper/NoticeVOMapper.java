package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.vo.NoticeVO;
@Service
public class NoticeVOMapper implements RowMapper<NoticeVO>{

	@Override
	public NoticeVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		NoticeVO noticeVO = new NoticeVO();
		
		noticeVO.setNoticeTitle(rs.getString("notice_title"));
		noticeVO.setNoticeWdate(rs.getDate("notice_wdate"));
		noticeVO.setNoticeNo(rs.getInt("notice_no"));// a태그로 링크걸어주기위함
		
		return noticeVO;
	}
}
