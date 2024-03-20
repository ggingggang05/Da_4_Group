package com.kh.da4jo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.da4jo.dao.CreditDao;
import com.kh.da4jo.dao.MemberDao;
import com.kh.da4jo.dto.CreditDto;
import com.kh.da4jo.dto.MemberDto;
import com.kh.da4jo.vo.PageVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/credit")
public class AdminCreditController {
	@Autowired
	private CreditDao creditDao;
	
	@Autowired
	private MemberDao memberDao;
	
	//사용자 충전 요청 목록 페이지
		@GetMapping("/creditList")
		public String creditList(@ModelAttribute(value="pageVO") PageVO pageVO, Model model,
						HttpSession session) {
			//충전테이블의 credit_status가 '승인 요청'인 경우 리스트 뽑기
			int count = creditDao.creditCount(pageVO);
			pageVO.setCount(count);
			
			List<CreditDto> list = creditDao.selectUnapprovedListByPaging(pageVO);
			model.addAttribute("creditList", list);
			
			return "/WEB-INF/views/admin/credit/creditList.jsp";
		}
		@PostMapping("/creditList")
		public String creditList(@ModelAttribute CreditDto creditDto) {
			// 상태 수정
			creditDao.updateStatus(creditDto.getCreditStatus(), creditDto.getMemberId());
			System.out.println(creditDto);
			//승인 완료일때만 credit 추가
			if(creditDto.getCreditStatus().equals("승인 완료")) {
				MemberDto memberDto = memberDao.selectOne(creditDto.getMemberId());
				memberDto.setMemberCredit(memberDto.getMemberCredit() + creditDto.getCreditCharge());
				
				memberDao.updateCredit(memberDto);
			}
			
			return "redirect:creditList";
		}
}
