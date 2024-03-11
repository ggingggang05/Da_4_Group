package com.kh.da4jo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.da4jo.dto.NoticeDto;
import com.kh.da4jo.mapper.NoticeMapper;

@Repository
public class NoticeDao {
	@Autowired 
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private NoticeMapper noticeMapper;
	
		
	// R(read)
	public List<NoticeDto> selectList(){// 공지의 단순 목록만 나오게
		String sql = "select * from notice order by notice_no asc";
		return jdbcTemplate.query(sql, noticeMapper);
	}
	public List<NoticeDto> selectList(String column, String keyword){// 공지의 검색 목록이 나옴
		String sql = "select * from notice where instr("+column+", ? ) > 0" 
										  +" order by " +column+"asc, notice_no asc";
		Object[] data = {keyword};
		return jdbcTemplate.query(sql, noticeMapper, data);
	}
	
	public NoticeDto selectOne(int noticeNo) {// 상세페이지 
		String sql = "select * from notice where notice_no = ?";
		Object[] data = {noticeNo};
		List<NoticeDto> list = jdbcTemplate.query(sql, noticeMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
}
