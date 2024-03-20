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
	@RequestMapping("/delivery-info")
	public String deliveryInfo() {
		return "/WEB-INF/views/document/delivery-info.jsp";
	}
	@RequestMapping("/delivery-step")
	public String deliveryStep() {
		return "/WEB-INF/views/document/delivery-step.jsp";
	}
	@RequestMapping("/clearance-code")
	public String clearanceCode() {
		return "/WEB-INF/views/document/clearance-code.jsp";
	}
	@RequestMapping("/tax")
	public String tax() {
		return "/WEB-INF/views/document/tax.jsp";
	}
	@RequestMapping("/tariff")
	public String tariff() {
		return "/WEB-INF/views/document/tariff.jsp";
	}
	@RequestMapping("/prohibition")
	public String prohibition() {
		return "/WEB-INF/views/document/prohibition.jsp";
	}
}
