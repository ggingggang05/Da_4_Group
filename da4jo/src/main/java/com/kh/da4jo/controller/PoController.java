package com.kh.da4jo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.da4jo.dao.PoDao;
import com.kh.da4jo.dto.PoDto;

@Controller
@RequestMapping("/po")
public class PoController {

	@Autowired
	private PoDao poDao;
	
	@RequestMapping("/list")
	public String list() {
		return "/WEB-INF/views/member/po/list.jsp";
	}
}
