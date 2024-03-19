package com.kh.da4jo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.kh.da4jo.dto.NoticeDto;
import com.kh.da4jo.mapper.NoticeMapper;
import com.kh.da4jo.mapper.NoticeVOMapper;
import com.kh.da4jo.vo.NoticeVO;
import com.kh.da4jo.vo.PageVO;

@Repository
public class NoticeDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private NoticeMapper noticeMapper;

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
//	public List<NoticeDto> selectList(String column, String keyword) {
//		String sql = "select " + "notice_no, notice_title, notice_content, "
//				+ "notice_writer, notice_wdate, notice_vcount " + "from notice " + "where instr(" + column + ", ?) > 0 "
//				+ "order by notice_no desc";
//		Object[] data = { keyword };
//		return jdbcTemplate.query(sql, noticeMapper, data);
//	}
	
	//통합+페이징
		public List<NoticeDto> selectListByPaging(PageVO pageVO){ 
			if(pageVO.isSearch()) {//검색
				String sql = "select * from ("
									+ "select rownum rn, TMP.* from ("
										+ "select "
											+ "notice_no, notice_title, notice_content, "
											+ "notice_writer, notice_wdate, notice_vcount "
										+ "from notice "
										+ "where instr("+pageVO.getColumn()+", ?) > 0 "
									+ ")TMP"
								+ ") where rn between ? and ?";
				Object[] data = {
						pageVO.getKeyword(), 
						pageVO.getBeginRow(), 
						pageVO.getEndRow()
				};
				return jdbcTemplate.query(sql, noticeMapper, data);
			}
			else {//목록
				String sql = "select * from ("
									+ "select rownum rn, TMP.* from ("
										+ "select "
											+ "notice_no, notice_title, notice_content, "
											+ "notice_writer, notice_wdate, notice_vcount "
										+ "from notice order by notice_no desc"
									+ ")TMP"
								+ ") where rn between ? and ?";
				Object[] data = {pageVO.getBeginRow(), pageVO.getEndRow()};
				System.out.println(pageVO.getCount());
				return jdbcTemplate.query(sql, noticeMapper, data);
			}
		}
	//카운트 - 목록일 경우와 검색일 경우를 각각 구현
	public int count(PageVO pageVO) {
		if(pageVO.isSearch()) {//검색
			String sql = "select count(*) from notice "
							+ "where instr("+pageVO.getColumn()+", ?) > 0";
			Object[] data = {pageVO.getKeyword()};
			return jdbcTemplate.queryForObject(sql, int.class, data);
		}
		else {//목록
			String sql = "select count(*) from notice";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}
	
	
	// 단일조회
	public NoticeDto selectOne(int noticeNo) {// 상세페이지
		String sql = "select * from notice where notice_no = ?";
		Object[] data = { noticeNo };
		List<NoticeDto> list = jdbcTemplate.query(sql, noticeMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	// 조회수 증가
	public boolean updateNoticeVcount(int noticeNo) {
		String sql = "update notice " + 
					"set notice_vcount = notice_vcount + 1 " +
					"where notice_no = ?";
		Object[] data = { noticeNo };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 수정
	public boolean update(NoticeDto noticeDto) {
		String sql = "update notice " 
					+ "set "
					+ "notice_title=?, notice_content=? " + "where notice_no=?";
		Object[] data = { noticeDto.getNoticeTitle(), noticeDto.getNoticeContent(), noticeDto.getNoticeNo() };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// D(delete) 삭세
	public boolean delete(int noticeNo) {
		String sql = "delete notice where notice_no = ?";
		Object[] data = { noticeNo };
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	@Autowired
	private NoticeVOMapper noticeVOMapper;

    // 풋터에 나올 목록 조회
	public List<NoticeVO> getNoticeList(){
		String sql = "SELECT notice_title, notice_wdate, notice_no FROM "
				+ "(SELECT notice_title, notice_wdate, notice_no FROM notice "
				+ "ORDER BY notice_wdate DESC) WHERE ROWNUM <= 10";
		
		return jdbcTemplate.query(sql, noticeVOMapper);
	}

}
