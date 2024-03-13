package com.kh.da4jo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.da4jo.dao.MemberDao;
import com.kh.da4jo.dto.MemberDto;
import com.kh.da4jo.service.EmailService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private EmailService emailService;
	
	
	//회원가입
	@GetMapping("/join")
	public String join() {
		return "/WEB-INF/views/member/join.jsp";
	}
	@PostMapping("/join")
	public String join(@ModelAttribute MemberDto memberDto) {
		memberDao.insert(memberDto);
		
		//가입 환영 메일 발송
		emailService.welcomSendMail(memberDto.getMemberEmail());
		
		return "redirect:login";
	}
	
//	@RequestMapping("/joinFinish")
//	public String joinFinish() {
//		return "/WEB-INF/views/member/joinFinish.jsp";
//	}
	
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
			session.setAttribute("loginId",	findDto.getMemberId());
			session.setAttribute("loginLevel",	findDto.getMemberLevel());
			
			//최종 로그인 시각 갱신
			memberDao.updateMemberLoginDate(findDto.getMemberId());
			
			return "redirect:/";
		}
		else {//로그인 실패
			return "redirect:login?error";
		}
	}
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId"); // 세션 값 삭제
		session.removeAttribute("loginLevel");
		return "redirect:/";
	}
	
	//마이페이지
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		//로그인 아이디 추출
		String loginId = (String) session.getAttribute("loginId");
		//아이디로 정보 조회
		MemberDto memberDto = memberDao.selectOne(loginId);
		//화면으로 전달
		model.addAttribute("memberDto", memberDto);
		
		return "/WEB-INF/views/member/mypage.jsp";
	}
	
	//회원 정보 수정 페이지
	@GetMapping("/mypage/change")
	public String change(Model model, HttpSession session) {
		//로그인 아이디 추출
		String loginId = (String)session.getAttribute("loginId");
		//아이디로 정보 조회
		MemberDto memberDto = memberDao.selectOne(loginId);
		//모델에 정보 추가
		model.addAttribute("memberDto", memberDto);
		
		return"/WEB-INF/views/member/mypage/change.jsp"; 
	}
	@PostMapping("/mypage/change")
	public String change(@ModelAttribute MemberDto memberDto, HttpSession session) {
		//로그인 아이디 추출
		String loginId = (String)session.getAttribute("loginId");
		//memberDto에 아이디 설정
		memberDto.setMemberId(loginId);
		//DB정보 조회
		MemberDto findDto = memberDao.selectOne(loginId);
		//판정
		boolean isValid = memberDto.getMemberPw().equals(findDto.getMemberPw());
		
		//변경 (판정문이 맞다면 == 현재 입력된 비밀번호와 원래 비밀번호 일치 여부 확인)
		if(isValid) {
			memberDao.updateMember(memberDto);
			return "redirect:mypage";
		} else {
			return "redirect:mypage/change?error";
		}
	}
	
	//회원 비밀번호 변경 페이지
	@GetMapping("/password")
	public String password() {
		return "/WEB-INF/views/member/mypage/password.jsp";
	}
	@PostMapping("/password")
	public String password(@RequestParam String originPw,
						@RequestParam String changePw,
						HttpSession session) {
		//로그인 아이디 추출
		String loginId = (String) session.getAttribute("loginId");
		
		//비밀번호 검사
		MemberDto findDto = memberDao.selectOne(loginId);
		boolean isValid = findDto.getMemberPw().equals(originPw);
		
		if(isValid) {
			MemberDto memberDto = new MemberDto();
			memberDto.setMemberId(loginId);
			memberDto.setMemberPw(changePw);
			memberDao.updateMemberPw(memberDto);
			
			return "redirect:mypage";
		}
		else {
			return "redirect:mypage?error";
		}
	}
	
	//회원 탈퇴 페이지
	@GetMapping("/mypage/exit")
	public String exit() {
		return "/WEB-INF/views/member/mypage/exit.jsp";
	}
//	@PostMapping("/mypage/exit")
//	public String exit(@RequestParam String memberPw,
//					@ModelAttribute MemberDto memberDto,
//					HttpSession session) {
//		String loginId = (String)session.getAttribute("loginId");
//		
//		MemberDto findDto = memberDao.selectOne(loginId);
//		boolean isValid = findDto.getMemberPw().equals(memberPw);
//		
//		if(isValid) {
//			try {
//				int 
//			}
//		}
//	}
	
	
}







