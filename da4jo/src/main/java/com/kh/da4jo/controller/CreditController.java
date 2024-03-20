package com.kh.da4jo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.da4jo.dao.CreditDao;
import com.kh.da4jo.dao.MemberDao;
import com.kh.da4jo.dto.CreditDto;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member/credit")
public class CreditController
{	
	@Autowired
	CreditDao creditDao;
	@Autowired
	MemberDao memberDao;
	
	@GetMapping("/charge")
	public String charge() {
//		String loginId = (String)session.getAttribute("loginId");
//		model.addAttribute("memberId", loginId);
		return "/WEB-INF/views/member/credit/charge.jsp";
	}
	//자동 충전 코드
//	@PostMapping("/charge")
//	public String charge(
//			@RequestParam int creditCharge, 
//			HttpSession session) {
//		String loginId = (String)session.getAttribute("loginId");
//		CreditDto creditDto = new CreditDto();
//		creditDto.setMemberId(loginId);
//		creditDto.setCreditCharge(creditCharge);
//		creditDao.insert(creditDto);
//		int chargedCredit = creditDto.getCreditCharge();
//		
//		MemberDto memberDto = memberDao.selectOne(loginId);
//		memberDto.setMemberCredit(memberDto.getMemberCredit() + chargedCredit);
//		
//		memberDao.updateCredit(memberDto);
//		
	
	
//		return "redirect:/member/mypage";
//	}
	@PostMapping("/charge")
	public String charge(HttpSession session, @RequestParam int creditCharge) {
		//로그인 아이디를 찾아서
		String loginId = (String)session.getAttribute("loginId");
		//새 크레딧 dto를 만들고
		CreditDto creditDto = new CreditDto();
		creditDto.setMemberId(loginId);
		creditDto.setCreditCharge(creditCharge);
		creditDto.setCreditStatus("승인 요청");
		creditDao.insert(creditDto);
		
		return "redirect:/member/mypage";
	}
	
	@RequestMapping("/chargeList")
	public String chargeList(HttpSession session, Model model) {
		String loginId = (String)session.getAttribute("loginId");
		List<CreditDto> list = creditDao.selectList(loginId);
		model.addAttribute("list", list);
		
		return "/WEB-INF/views/member/credit/chargeList.jsp";		
	}
}
