package com.kh.da4jo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.da4jo.dao.NoticeDao;
import com.kh.da4jo.dto.NoticeDto;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/board/notice")
public class AdminNoticeController {
	@Autowired
	private NoticeDao noticeDao;
	// 공지사항 관련 
	@GetMapping("/write")
	public String boardNoticeWrite() {
		return "/WEB-INF/views/board/notice/write.jsp";
	}
	@PostMapping("/write")
	public String boardNoticeWrite(@ModelAttribute NoticeDto noticeDto,
								   HttpSession session) {
		// 세션에서 로그인 한 사용자 ID 추출
		String loginId = (String)session.getAttribute("loginId");
		// 아이디를 게시글 정보에 포함
		noticeDto.setNoticeWriter(loginId);
		int sequence = noticeDao.getSequence();
		noticeDto.setNoticeNo(sequence);
		noticeDao.insert(noticeDto);
		return "redirect:/board/notice/detail?noticeNo="+sequence;	
	}
}
