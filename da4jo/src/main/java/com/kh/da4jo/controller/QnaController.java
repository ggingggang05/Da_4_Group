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

import com.kh.da4jo.dao.MemberDao;
import com.kh.da4jo.dao.QnaDao;
import com.kh.da4jo.dto.MemberDto;
import com.kh.da4jo.dto.QnaDto;
import com.kh.da4jo.vo.PageVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/board/qna")
public class QnaController {
	
	@Autowired
	private QnaDao qnaDao;
	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/write")
	public String write() {
		return "/WEB-INF/views/board/qna/write.jsp";
	}

	@PostMapping("/write")
	public String write(@ModelAttribute QnaDto qnaDto, HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		qnaDto.setQnaWriter(loginId);
		
		int sequence = qnaDao.getSequence();
		qnaDto.setQnaNo(sequence);
		qnaDao.insert(qnaDto);
		
		
		
		
		return "redirect:detail?qnaNo="+sequence;
	
	}

	//목록
//	@RequestMapping("/list")
//	public String list(@RequestParam(required = false) String column,
//							@RequestParam(required = false) String keyword, Model model) {
//		boolean isSearch = column != null && keyword != null;
//		if(isSearch) {
//			model.addAttribute("list", qnaDao.selectList(column, keyword));
//		}
//		else {
//			model.addAttribute("list", qnaDao.selectList());
//		}
//		
//		return "/WEB-INF/views/board/qna/list.jsp";
//	}
	
	@RequestMapping("/list")
	public String qna(@ModelAttribute(value = "pageVO") PageVO pageVO,
					 HttpSession session, Model model) {
		String loginId = (String) session.getAttribute("loginId");

		MemberDto memberDto = memberDao.selectOne(loginId);
		model.addAttribute("memberDto", memberDto);
		
		int count = qnaDao.count();
		pageVO.setCount(count);
		
		List<QnaDto> list = qnaDao.selectListByQnaPaging(pageVO, loginId);
		model.addAttribute("qnaList", list); 
		
		return "/WEB-INF/views/board/qna/list.jsp";
	}

	//상세조회
	@RequestMapping("/detail")
	public String detail(@RequestParam int qnaNo, Model model) {
		
		QnaDto qnaDto = qnaDao.selectOne(qnaNo);
		model.addAttribute("qnaDto", qnaDto);
		
		return "/WEB-INF/views/board/qna/detail.jsp";
	}

	//수정
	@GetMapping("/edit") 
	public String edit(@RequestParam int qnaNo, Model model) {
		QnaDto qnaDto = qnaDao.selectOne(qnaNo);
		model.addAttribute("qnaDto", qnaDto);
		return "/WEB-INF/views/board/qna/edit.jsp";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute QnaDto qnaDto) {
		qnaDao.update(qnaDto);
		return "redirect:detail?qnaNo=" + qnaDto.getQnaNo();
	}

	//삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam int qnaNo) {
		qnaDao.delete(qnaNo);
		return "redirect:/board/qna/list";
	}
}
