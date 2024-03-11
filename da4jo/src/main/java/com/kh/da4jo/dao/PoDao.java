package com.kh.da4jo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.da4jo.mapper.PoMapper;

@Repository
public class PoDao {
	@Autowired 
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private PoMapper poMapper;
	
	
	// C(create)
	
	
	// R(read)
		
	// U(update)
		
	// D(delete)

}
