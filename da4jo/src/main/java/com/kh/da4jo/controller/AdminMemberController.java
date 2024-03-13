package com.kh.da4jo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.da4jo.dao.MemberDao;
import com.kh.da4jo.dto.MemberDto;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController
{
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping("/search")
	public String search(
			@RequestParam(required = false) String column,
			@RequestParam(required = false) String keyword,
			Model model) {
		boolean isSearch = column != null && keyword != null;
		if(isSearch) {
			switch (column) {
			case "MEMBER_ID":
			case "MEMBER_NAME_KOR":
			case "MEMBER_NAME_ENG":
			case "MEMBER_EMAIL":
			case "MEMBER_CLEARANCE_ID":
				List<MemberDto> list = memberDao.selectList(column, keyword);
				model.addAttribute("list", list);
			}
		}
		return "/WEB-INF/views/admin/member/search.jsp";
	}
//	@RequestMapping("/detail")
//	public String detail(@RequestParam String memberId, Model model) {
//		MemberDto memberDto = memberDao.selectOne(memberId);
//		model.addAttribute("memberDto", memberDto);
//		return "/WEB-INF/views/admin/member/detail.jsp";
//	}
}
