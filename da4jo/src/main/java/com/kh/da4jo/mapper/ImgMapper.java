package com.kh.da4jo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.da4jo.dto.ImgDto;

@Service
public class ImgMapper implements RowMapper<ImgDto>
{

	@Override
	public ImgDto mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		ImgDto imgDto = new ImgDto();
		imgDto.setImgNo(rs.getInt("IMG_NO"));
		imgDto.setImgName(rs.getString("IMG_NAME"));
		imgDto.setImgType(rs.getString("IMG_TYPE"));
		imgDto.setImgSize(rs.getLong("IMG_SIZE"));
		imgDto.setImgUptimeDate(rs.getDate("IMG_UPTIME"));
		return imgDto;
	}
	
}
