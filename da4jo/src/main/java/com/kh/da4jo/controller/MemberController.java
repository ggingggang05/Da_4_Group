package com.kh.da4jo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.da4jo.dao.MemberDao;
import com.kh.da4jo.dto.MemberDto;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;
	
	//회원가입
	@GetMapping("/join")
	public String join() {
		return "/WEB-INF/views/member/join.jsp";
	}
	@PostMapping("/join")
	public String join(@ModelAttribute MemberDto memberDto) {
		memberDao.insert(memberDto);
		return "redirect:joinFinish";
	}
		@RequestMapping("/joinFinish")
		public String joinFinish() {
			return "/WEB-INF/views/member/joinFinish.jsp";
	}
	
	//로그인
	@GetMapping("/login")
	public String login() {
		return "/WEB-INF/views/member/login.jsp";
	}
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDto inputDto,
										HttpSession session) {
		//아이디 조회
		MemberDto findDto = memberDao.selectOne(inputDto.getMemberId());
		//로그인 가능 여부 판정
		boolean isValid = findDto != null 
				&& inputDto.getMemberPw().equals(findDto.getMemberPw());
		//결과 처리
		if(isValid) {
			session.setAttribute("loginID",	findDto.getMemberId());
			session.setAttribute("loginLevel",	findDto.getMemberLevel());
			
			//최종 로그인 시각 갱신
			memberDao.updateMemberLoginDate(findDto.getMemberId());
			
			return "redirect:/";
		}
		else {//로그인 실패
			return "redicect:login?error";
		}
	}
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId"); // 세션 값 삭제
		session.removeAttribute("loginLevel");
		return "redirect:/";
	}
	
	
}







