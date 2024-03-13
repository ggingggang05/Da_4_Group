package com.kh.da4jo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.da4jo.dao.NoticeDao;
import com.kh.da4jo.dto.NoticeDto;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/board/notice")
public class AdminNoticeController {
	@Autowired
	private NoticeDao noticeDao;
	// 공지사항 작성 
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
	// 공지사항 수정
	@GetMapping("/edit")
	public String edit(@RequestParam int noticeNo, Model model) {
		NoticeDto noticeDto = noticeDao.selectOne(noticeNo);
		//model.addAttribute("이름", 데이터);
		model.addAttribute("noticeDto", noticeDto);
		return "/WEB-INF/views/board/notice/edit.jsp";
	}
	@PostMapping("/edit")
	public String edit(@ModelAttribute NoticeDto noticeDto) {
		if(noticeDao.update(noticeDto)) { // 수정성공한다면 
			return "redirect:/board/notice/detail?="+noticeDto.getNoticeNo();
		}
		else {
			return "redirect:editFail";
		}
	}
	
	
	
	// 공지사항 삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam int noticeNo) {
		noticeDao.delete(noticeNo);
		return "redirect:/board/notice/list";
	}
}
