package com.kh.da4jo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.kh.da4jo.dto.QnaDto;
import com.kh.da4jo.mapper.QnaMapper;

@Repository
public class QnaDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private QnaMapper qnaMapper;
	
	//시퀀스
	public int getSequence() {
		String sql = "select qna_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	//작성
	public void insert(QnaDto qnaDto) {
		String sql = "insert into qna("
				+ "qna_no, qna_secreat, qna_title, qna_content, "
				+ "qna_writer, qna_wdate, qna_vcount) "
				+ "values(?, ?, ?, ?, ?, ?)";
		Object[] data = {
					qnaDto.getQnaNo(), qnaDto.getQnaSecreate(), 
					qnaDto.getQnaTitle(), qnaDto.getQnaContent(),
					qnaDto.getQnaWriter(), qnaDto.getQnaWdate(),
					qnaDto.getQnaVcount()					
				};
		jdbcTemplate.update(sql, data);
	}
	
	//정렬 기준 정하기
	//목록
	public List<QnaDto> selectList() {
		String sql = "select "
				+ "qna_no, qna_secreat, qna_title, qna_content, "
				+ "qna_writer, qna_wdate, qna_vcount "
				+ "from qna order by qna_no desc";
		return jdbcTemplate.query(sql, qnaMapper);
	}
	
	//검색
	public List<QnaDto> selectList(String column, String keyword) {
		String sql = "select "
				+ "qna_no, qna_secreat, qna_title, qna_content, "
				+ "qna_writer, qna_wdate, qna_vcount "
				+ "from qna "
				+ "where instr("+column+", ?) > 0 "
				+ "order by qna_no desc";
		Object[] data = {keyword};
		return jdbcTemplate.query(sql, qnaMapper, data);
	}
	
	//삭제
	public boolean delete(int qnaNo) {
		String sql = "delete qna where qna_no = ?";
		Object[] data = {qnaNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	
}