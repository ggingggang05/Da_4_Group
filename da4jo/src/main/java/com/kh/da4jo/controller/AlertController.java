package com.kh.da4jo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/alert")
public class AlertController
{
	@RequestMapping("/hasntServiceHistory")
	public String hasntServiceHistory() {
		return "/WEB-INF/views/alert/hasntServiceHistory.jsp";
	}
	
	@RequestMapping("/isBlock")
	public String isBlock() {
		return "/WEB-INF/views/alert/isBlock.jsp";
	}
}
