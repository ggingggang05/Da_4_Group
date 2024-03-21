package com.kh.da4jo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.kh.da4jo.dto.ReviewDto;
import com.kh.da4jo.mapper.BestReviewVOMapper;
import com.kh.da4jo.mapper.ReviewMapper;
import com.kh.da4jo.vo.BestReviewVO;

@Repository
public class ReviewDao {
	@Autowired 
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private ReviewMapper reviewMapper;
	
	//시퀀스
	public int getSequence() {
		String sql = "select review_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	//작성
	public void insert(ReviewDto reviewDto) {
		String sql = "insert into review("
						+ "review_no, review_title, review_content, "
						+ "review_writer, review_vcount, review_star) "
						+ "values(?, ?, ?, ?, ?, ?)";
		Object[] data = {
				reviewDto.getReviewNo(), reviewDto.getReviewTitle(), 
				reviewDto.getReviewContent(), reviewDto.getReviewWriter(), 
				reviewDto.getReviewVcount(), reviewDto.getReviewStar()
		};
		jdbcTemplate.update(sql, data);
		
	}
	
	//목록 [페이징 구현 전까지 주석]
//		public List<ReviewDto> selectList() {
//			String sql = "select "
//					+ "review_no, review_title, review_content, "
//					+ "review_writer, review_wdate, review_vcount "
//					+ "from review order by review_no desc";
//			return jdbcTemplate.query(sql, reviewMapper);
//			
//		}
	 
	//목록 단순 리스트

	//자신의 내역을 조회
	public List<ReviewDto> selectList(String memberId) {
		String sql = "select * from review where REVIEW_WRITER = ? "
								+ "order by review_no desc";
		Object[] data = {memberId};
		return jdbcTemplate.query(sql, reviewMapper, data);
	}
	public List<ReviewDto> selectList() {
		String sql = "select * from review order by review_no desc";
		return jdbcTemplate.query(sql, reviewMapper);
	}
	
	//검색
	public List<ReviewDto> selectList(String column, String keyword) {
		String sql = "select "
				+ "review_no, review_title, review_content, "
				+ "review_writer, review_wdate, review_vcount "
				+ "from review "
				+ "where instr("+column+", ?) > 0 "
				+ "order by review_no desc";
		Object[] data = {keyword};
		return jdbcTemplate.query(sql, reviewMapper, data);
	}
	
	//단일조회
		public ReviewDto selectOne(int reviewNo) {
			String sql = "select * from review where review_no = ?";
			Object[] data = {reviewNo};
			List<ReviewDto> list = jdbcTemplate.query(sql, reviewMapper, data);
			return list.isEmpty() ? null : list.get(0);
		}
		
	//삭제
	public boolean delete(int reviewNo) {
		String sql = "delete review where review_no = ?";
		Object[] data = {reviewNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	//수정
	public boolean update(ReviewDto reviewDto) {
		String sql = "update review "
						+ "set review_title=?, review_content=? "
						+ "where review_no = ?";
		Object[] data = {
				reviewDto.getReviewTitle(), reviewDto.getReviewContent(),
				reviewDto.getReviewNo()
		};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	//연결
	public void connect(int reviewNo, int imgNo) {
		String sql = "insert into review_img(img_no, review_no) values(?, ?)";
		Object[] data = {imgNo, reviewNo};
		jdbcTemplate.update(sql, data);
	}
	
	//이미지
	public int findImgNo(int reviewNo) {
		String sql = "select img_no from review_img where review_no = ?";
		Object[] data = {reviewNo};
		return jdbcTemplate.queryForObject(sql, int.class, data);
	}
	
	//회원 각자의 리뷰 개수 구하기
	public int countEachMember(String memberId) {
		String sql = "select count(*) from review where review_writer=?";
		Object[] data = {memberId};
		return jdbcTemplate.queryForObject(sql, int.class, data);
	}
	
	//리뷰 조회수 증가
	public boolean updateReviewReadcount(int reviewNo) {
		String sql = "update review set review_vcount = review_vcount + 1 where review_no = ?";
		Object[] data = {reviewNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	@Autowired
	BestReviewVOMapper bestReviewVOMapper;
	//베스트리뷰(5점 중 최근 3명)
	public List<BestReviewVO> getBestReview() {
		String sql = "SELECT REVIEW_NO, REVIEW_WRITER "
				+ "FROM ("
				+ "SELECT REVIEW_NO, REVIEW_WRITER, ROW_NUMBER() OVER (ORDER BY REVIEW_WDATE DESC) AS RN "
				+ "FROM REVIEW "
				+ "WHERE review_star = 5 "
				+ ") sub "
				+ "WHERE RN <= 3";
		return jdbcTemplate.query(sql, bestReviewVOMapper);
	}
}
