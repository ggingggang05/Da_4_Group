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

import com.kh.da4jo.dao.MemberBlockDao;
import com.kh.da4jo.dao.MemberDao;
import com.kh.da4jo.dto.MemberBlockDto;
import com.kh.da4jo.dto.MemberDto;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController
{
	@Autowired
	MemberDao memberDao;
	@Autowired
	MemberBlockDao memberBlockDao;
	
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
	@RequestMapping("/detail")
	public String detail(@RequestParam String memberId, Model model) {
		MemberDto memberDto = memberDao.selectOne(memberId);
		model.addAttribute("memberDto", memberDto);
		return "/WEB-INF/views/admin/member/detail.jsp";
	}
	
	//회원 차단
	@GetMapping("/block/add")
	public String add(@RequestParam String memberId, Model model) {
		model.addAttribute("memberId", memberId);
		return "/WEB-INF/views/admin/member/block/add.jsp";
	}
	@PostMapping("/block/add")
	public String add(@RequestParam String memberId,
									@RequestParam String blockReason) {
		//차단할 사용자의 Dto를 찾아서
		MemberDto targetDto = memberDao.selectOne(memberId);
		//차단 상태를 Y로 바꾸고
		targetDto.setMemberBlock("Y");
		//db에 업데이트
		memberBlockDao.changeMemberStatus(targetDto);
		//차단멤버 db에 추가
		//dto생성
		MemberBlockDto memberBlockDto = new MemberBlockDto();
		//id와 이유 추가(시간은 sysdate 번호는 sequence로 부여)
		memberBlockDto.setBlockMemberId(memberId);
		memberBlockDto.setBlockReason(blockReason);
		memberBlockDto.setBlockStatus("이용정지");
		memberBlockDao.insertMemberBlock(memberBlockDto);
		return "redirect:/admin/member/detail?memberId=" + memberId;
	}
	
	//회원 차단 해제
		@GetMapping("/block/cancel")
		public String cancel(@RequestParam String memberId, Model model) {
			model.addAttribute("memberId", memberId);
			return "/WEB-INF/views/admin/member/block/cancel.jsp";
		}
		@PostMapping("/block/cancel")
		public String cancel(@RequestParam String memberId,
										@RequestParam String cancelReason) {
			//차단 해제할 사용자의 Dto를 찾아서
			MemberDto targetDto = memberDao.selectOne(memberId);
			//차단 상태를 N으로 바꾸고
			targetDto.setMemberBlock("N");
			//db에 업데이트
			memberBlockDao.changeMemberStatus(targetDto);
			//차단멤버 db에 차단해제 상태로 추가
			//dto생성
			MemberBlockDto memberBlockDto = new MemberBlockDto();
			//id와 이유 추가(시간은 sysdate 번호는 sequence로 부여)
			memberBlockDto.setBlockMemberId(memberId);
			memberBlockDto.setBlockReason(cancelReason);
			memberBlockDto.setBlockStatus("차단해제");
			memberBlockDao.insertMemberBlock(memberBlockDto);
			return "redirect:/admin/member/detail?memberId=" + memberId;
		}
}
