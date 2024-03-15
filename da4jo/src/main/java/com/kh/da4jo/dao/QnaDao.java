package com.kh.da4jo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.kh.da4jo.dto.QnaDto;
import com.kh.da4jo.dto.ReviewDto;
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
				+ "qna_no,qna_secreat, qna_title, qna_content, "
				+ "qna_writer, qna_vcount) "
				+ "values(?, ?, ?, ?, ?, ?)";
		Object[] data = {
					qnaDto.getQnaNo(), qnaDto.getQnaSecreate(),
					qnaDto.getQnaTitle(), qnaDto.getQnaContent(),
					qnaDto.getQnaWriter(), qnaDto.getQnaVcount()				
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
	
	//단일 조회
	public QnaDto selectOne(int qnaNo) {
		String sql = "select * from qna where qna_no = ?";
		Object[] data = {qnaNo};
		List<QnaDto> list = jdbcTemplate.query(sql, qnaMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
	
	//수정
		public boolean update(QnaDto qnaDto) {
			String sql = "update qna "
							+ "set qna_title=?, qna_content=? "
							+ "where qna_no = ?";
			Object[] data = {
					qnaDto.getQnaTitle(), qnaDto.getQnaContent(),
					qnaDto.getQnaNo()
			};
			return jdbcTemplate.update(sql, data) > 0;
		}
	
	//삭제
	public boolean delete(int qnaNo) {
		String sql = "delete qna where qna_no = ?";
		Object[] data = {qnaNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	//Qna 조회수 증가
	public boolean updateQnaReadcount(int qnaNo) {
		String sql = "update qna set qna_vcount = qna_vcount + 1 where qna_no = ?";
		Object[] data = {qnaNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
}
