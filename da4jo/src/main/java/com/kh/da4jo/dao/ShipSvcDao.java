package com.kh.da4jo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.da4jo.mapper.PaymentVOMapper;
import com.kh.da4jo.mapper.SettlementVOMapper;

@Repository
public class ShipSvcDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private PaymentVOMapper paymentVOMapper;
	@Autowired
	private SettlementVOMapper settlementVOMapper;
}
