package com.kh.da4jo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminHomeController
{
	@RequestMapping("/")
	public String adminHome() {
		return "/WEB-INF/views/admin/home.jsp";
	}
}
