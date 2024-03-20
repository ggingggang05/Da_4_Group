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

import com.kh.da4jo.dao.NoticeDao;
import com.kh.da4jo.dto.NoticeDto;
import com.kh.da4jo.vo.PageVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/board")
public class AdminBoardNoticeController {
	
	@Autowired
	private NoticeDao noticeDao;
	
	// 공지사항 작성
		@GetMapping("/notice/write")
		public String boardNoticeWrite() {
			return "/WEB-INF/views/admin/board/notice/write.jsp";
		}

		@PostMapping("/notice/write")
		public String boardNoticeWrite(@ModelAttribute NoticeDto noticeDto, HttpSession session) {
			// 세션에서 로그인 한 사용자 ID 추출
			String loginId = (String)session.getAttribute("loginId");
			// 아이디를 게시글 정보에 포함
			noticeDto.setNoticeWriter(loginId);
			int sequence = noticeDao.getSequence();
			noticeDto.setNoticeNo(sequence);
			noticeDao.insert(noticeDto);
			return "redirect:detail?noticeNo=" + sequence;
		}

		// 공지사항 수정
		@GetMapping("/notice/edit")
		public String edit(@RequestParam int noticeNo, Model model) {
			NoticeDto noticeDto = noticeDao.selectOne(noticeNo);
			// model.addAttribute("이름", 데이터);
			model.addAttribute("noticeDto", noticeDto);
			return "/WEB-INF/views/admin/board/notice/edit.jsp";
		}

		@PostMapping("/notice/edit")
		public String edit(@ModelAttribute NoticeDto noticeDto) {
			if (noticeDao.update(noticeDto)) { // 수정성공한다면
				return "redirect:detail?noticeNo=" + noticeDto.getNoticeNo();
			} else {
				return "redirect:list";
			}
		}	
		
		@RequestMapping("/notice/list")
		public String list(
				@ModelAttribute PageVO pageVO,
				Model model) {
			//세부 계산은 클래스에서 수행하도록 하고 count, list만 처리
			int count = noticeDao.count(pageVO);
			pageVO.setCount(count);
			model.addAttribute("pageVO", pageVO);
			List<NoticeDto> noticeDto = noticeDao.selectListByPaging(pageVO);
			model.addAttribute("noticeDto", noticeDto);
			
			return "/WEB-INF/views/admin/board/notice/list.jsp";
		}
		
		// 공지 상세
		@RequestMapping("/notice/detail")
		public String detail(@RequestParam int noticeNo, Model model) {
			NoticeDto noticeDto = noticeDao.selectOne(noticeNo); // 게시글 번호 주면 상세 페이지
			
			model.addAttribute("noticeDto", noticeDto); // noticeDto라는 이름으로 jsp에 객체 전달(게시글번호)

			return "/WEB-INF/views/admin/board/notice/detail.jsp";
		}

		// 공지사항 삭제
		@RequestMapping("/notice/delete")
		public String delete(@RequestParam int noticeNo) {
			noticeDao.delete(noticeNo);
			return "redirect:list";
		}
		

}
