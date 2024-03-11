package com.kh.da4jo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.da4jo.dao.NoticeDao;
import com.kh.da4jo.dto.NoticeDto;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private NoticeDao noticeDao;
	
	// 공지사항 관련 
	@GetMapping("/board/notice/write")
	public String boardNoticeWrite() {
		return "/WEB-INF/views/board/notice/write.jsp";
	}
	@PostMapping("/board/notice/write")
	public String boardNoticeWrite(@ModelAttribute NoticeDto noticeDto) {
		noticeDao.insert(noticeDto);
		return "redirect:detail?noticeNo="+noticeDto.getNoticeNo();
	}
}
