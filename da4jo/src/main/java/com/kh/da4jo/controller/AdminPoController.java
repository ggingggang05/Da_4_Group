package com.kh.da4jo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.da4jo.dao.PoDao;
import com.kh.da4jo.dto.PoDto;


@Controller
@RequestMapping("/admin/po")
public class AdminPoController {
	
	@Autowired
	private PoDao poDao;
	
	
	@RequestMapping("/orderList")
	public String orderList(@RequestParam(required = false) String column, @RequestParam(required = false) String keyword,
			Model model) {
		// 기본은 목록을 띄워주고 원하면 검색을 할 수 있게 구현
		boolean isSearch = column != null && keyword != null;
		// column 값과 keyword 값이 둘다 null이 아닌 경우는 검색 페이지를 보여주는 변수 설정
		List<PoDto> poList = isSearch ? poDao.selectList(column, keyword) : poDao.selectList();
		model.addAttribute("poList", poList); // jsp에 list라는 이름으로 매개변수의 값을 객체에 담아 전달
		return "/WEB-INF/views/admin/po/orderList.jsp";
	}
	
	@GetMapping("/orderDetail")
	public String orderDetail(@RequestParam int poNo, Model model) {
		PoDto poDto = poDao.selectOne(poNo);
		model.addAttribute("poDto",poDto);
		return "/WEB-INF/views/admin/po/orderDetail.jsp";
	}
	@PostMapping("/orderDetail")
	public String orderDetail(@ModelAttribute PoDto poDto) {
		System.out.println(poDto.toString());
		poDao.update(poDto);
		return "redirect:orderList";
	}
	@RequestMapping("/processList")
	public String processList(@RequestParam(required = false) String column, @RequestParam(required = false) String keyword,
			Model model) {
		// 기본은 목록을 띄워주고 원하면 검색을 할 수 있게 구현
		boolean isSearch = column != null && keyword != null;
		// column 값과 keyword 값이 둘다 null이 아닌 경우는 검색 페이지를 보여주는 변수 설정
		List<PoDto> poList = isSearch ? poDao.selectList(column, keyword) : poDao.selectList();
		model.addAttribute("poList", poList); // jsp에 list라는 이름으로 매개변수의 값을 객체에 담아 전달
		return "/WEB-INF/views/admin/po/processList.jsp";
	}
	
	@GetMapping("/processDetail")
	public String processDetail(@RequestParam int poNo, Model model) {
		PoDto poDto = poDao.selectOne(poNo);
		model.addAttribute("poDto",poDto);
		return "/WEB-INF/views/admin/po/processDetail.jsp";
	}
	@PostMapping("/processDetail")
	public String processDetail(@ModelAttribute PoDto poDto) {
		System.out.println(poDto.toString());
		poDao.update(poDto);
		return "redirect:processList";
	}
}
