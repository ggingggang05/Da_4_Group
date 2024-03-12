package com.kh.da4jo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.da4jo.dao.NoticeDao;
import com.kh.da4jo.dto.NoticeDto;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeDao noticeDao;
	
	// 공지 목록 + 검색
	@RequestMapping("/list")
	public String list(
			@RequestParam (required = false)String column, 
			@RequestParam (required = false)String keyword,
			Model model) {
		// 기본은 목록을 띄워주고 원하면 검색을 할 수 있게 구현
		boolean isSearch = column != null && keyword != null;
		// column 값과 keyword 값이 둘다 null이 아닌 경우는 검색 페이지를 보여주는 변수 설정
		
		List<NoticeDto> list = isSearch ? noticeDao.selectList(column, keyword) : noticeDao.selectList();
		
		model.addAttribute("list",list); // jsp에 list라는 이름으로 매개변수의 값을 객체에 담아 전달
		
		return "/WEB-INF/views/board/notice/list.jsp";
	}
	
	// 공지 상세
	@RequestMapping("/detail")
	public String detail(@RequestParam int noticeNo, Model model) {
		NoticeDto noticeDto = noticeDao.selectOne(noticeNo); // 게시글 번호 주면 상세 페이지
		model.addAttribute("noticeDto",noticeDto); // noticeDto라는 이름으로 jsp에 객체 전달(게시글번호)
		
		return "/WEB-INF/views/board/notice/detail.jsp";
	}
}
