package com.kh.da4jo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.da4jo.dto.ImgDto;
import com.kh.da4jo.mapper.ImgMapper;

@Repository
public class ImgDao
{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private ImgMapper imgMapper;
	
	public int getSequnce() {
		String sql = "SELECT IMG_SEQ.NEXTVAL FROM DUAL";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	public void insert(ImgDto imgDto) {
		String sql = "INSERT INTO IMG("
				+ "IMG_NO, IMG_NAME, IMG_TYPE, IMG_SIZE) "
				+ "VALUES(?, ?, ?, ?)";
		Object[] datas = {imgDto.getImgNo(), imgDto.getImgName(),
										imgDto.getImgType(), imgDto.getImgSize()};
		jdbcTemplate.update(sql, datas);
	}
	
	public ImgDto selectOne(int imgNo) {
		String sql = "SELECT * FROM IMG WHERE IMG_NO = ?";
		List<ImgDto> list = jdbcTemplate.query(sql, imgMapper, imgNo);
		return list.isEmpty() ? null : list.get(0);
	}
	
	public boolean delete(int imgNo) {
		String sql = "DELETE IMG WHERE IMG_NO = ? ";
		return jdbcTemplate.update(sql, imgNo) > 0;
	}
}
