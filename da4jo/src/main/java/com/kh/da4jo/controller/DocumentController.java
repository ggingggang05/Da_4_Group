package com.kh.da4jo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/document")
public class DocumentController
{
	@RequestMapping("/buying-info")
	public String buyingInfo() {
		return "/WEB-INF/views/document/buying-info.jsp";
	}
	@RequestMapping("/buying-step")
	public String buyingStep() {
		return "/WEB-INF/views/document/buying-step.jsp";
	}
}
