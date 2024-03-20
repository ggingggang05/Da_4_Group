package com.kh.da4jo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.da4jo.dao.NoticeDao;
import com.kh.da4jo.dto.NoticeDto;
import com.kh.da4jo.vo.PageVO;


@Controller
@RequestMapping("/board/notice")
public class NoticeController {

	@Autowired
	private NoticeDao noticeDao;

	@RequestMapping("/list")
	public String list(
			@ModelAttribute PageVO pageVO,
			Model model) {
		//세부 계산은 클래스에서 수행하도록 하고 count, list만 처리
		int count = noticeDao.count(pageVO);
		pageVO.setCount(count);
		model.addAttribute("pageVO", pageVO);
		List<NoticeDto> noticeDto = noticeDao.selectListByPaging(pageVO);
		model.addAttribute("noticeDto", noticeDto);
		
		return "/WEB-INF/views/board/notice/list.jsp";
	}
	

	// 공지 상세
	@RequestMapping("/detail")
	public String detail(@RequestParam int noticeNo, Model model) {
		NoticeDto noticeDto = noticeDao.selectOne(noticeNo); // 게시글 번호 주면 상세 페이지
		
		model.addAttribute("noticeDto", noticeDto); // noticeDto라는 이름으로 jsp에 객체 전달(게시글번호)

		return "/WEB-INF/views/board/notice/detail.jsp";
	}

	// 풋터 리스트
	@GetMapping("/footer")
	public String footer(Model model){
		List<NoticeDto> noticeDto = noticeDao.selectList();
		model.addAttribute("noticeDto",noticeDto);
		return "/WEB-INF/views/notice.jsp";
	}

}
