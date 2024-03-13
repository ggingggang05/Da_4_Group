package com.kh.da4jo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
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
	@Autowired

	// C(create)
	// noticeNo 시퀀스 미리 뽑는코드
	public int getSequence() {
		String sql = "select notice_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	// 공지사항 등록
	public void insert(NoticeDto noticeDto) {
		String sql = "insert into notice(notice_no, notice_title, notice_content," + "notice_writer) "
				+ "values(?, ?, ?, ?)";
		Object[] data = { noticeDto.getNoticeNo(), noticeDto.getNoticeTitle(), noticeDto.getNoticeContent(),
				noticeDto.getNoticeWriter() };
		jdbcTemplate.update(sql, data);
	}

	// R(read) 공지목록
	public List<NoticeDto> selectList() {// 공지의 단순 목록만 나오게
		String sql = "select " + "notice_no, notice_title, notice_content, "
				+ "notice_writer, notice_wdate, notice_vcount " + "from notice order by notice_no desc";
		return jdbcTemplate.query(sql, noticeMapper);
	}

	// 공지의 검색 목록이 나옴
	public List<NoticeDto> selectList(String column, String keyword) {
		String sql = "select " + "notice_no, notice_title, notice_content, "
				+ "notice_writer, notice_wdate, notice_vcount " + "from notice " + "where instr(" + column + ", ?) > 0 "
				+ "order by notice_no desc";
		Object[] data = { keyword };
		return jdbcTemplate.query(sql, noticeMapper, data);
	}

	// 단일조회
	public NoticeDto selectOne(int noticeNo) {// 상세페이지
		String sql = "select * from notice where notice_no = ?";
		Object[] data = { noticeNo };
		List<NoticeDto> list = jdbcTemplate.query(sql, noticeMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	// 수정
	public boolean update(NoticeDto noticeDto) {
		String sql = "update notice " + "set " + "notice_title=?, notice_content=? " + "where notice_no=?";
		Object[] data = { noticeDto.getNoticeTitle(), noticeDto.getNoticeContent(), noticeDto.getNoticeNo() };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// D(delete) 삭세
	public boolean delete(int noticeNo) {
		String sql = "delete notice where notice_no = ?";
		Object[] data = { noticeNo };
		return jdbcTemplate.update(sql, data) > 0;
	}

}
