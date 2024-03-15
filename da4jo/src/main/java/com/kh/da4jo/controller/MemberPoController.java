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
import com.kh.da4jo.dao.PoDao;
import com.kh.da4jo.dto.MemberDto;
import com.kh.da4jo.dto.PoDto;
import com.kh.da4jo.vo.PageVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member/mypage/purchase")
public class MemberPoController {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private PoDao poDao;
	
	//구매 대행 신청서 목록
	@RequestMapping("/list")
	public String list(@ModelAttribute(value = "pageVO") PageVO pageVO, Model model,
						HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		
		MemberDto memberDto = memberDao.selectOne(loginId);
		model.addAttribute(memberDto);
		
		//페이징을 PageVO에서 처리
		//여기선 count 및 list만 처리함
		int count = poDao.count();
		pageVO.setCount(count);
		
		List<PoDto> list = poDao.selectListByPaging(pageVO, loginId);
		model.addAttribute("poList", list);
		
		return "/WEB-INF/views/member/mypage/purchase/list.jsp";
	}
	
	//구매 대행 신청서
	@RequestMapping("/detail")
	public String detail(@RequestParam int poNo, Model model, HttpSession session) {
		//구매서 테이블에서 구매서 번호로 조회 후 넘겨주기
		PoDto poDto = poDao.selectOne(poNo);
		model.addAttribute("poDto", poDto);
		
		if(poDto.getPoNameEng() != null) { //작성자가 탈퇴하지 않았다면
			MemberDto memberDto = memberDao.selectOne(poDto.getPoCustomerId());//작성자 아이디로 조회
			model.addAttribute("memberDto", memberDto);
		}
		
		return "/WEB-INF/views/member/mypage/purchase/detail.jsp";
		
	}
	
	//구매 대행 신청서에 대한 결제 페이지
//	@GetMapping("/payment")
//	public String payment() {
//		
//	}
//	@PostMapping("/payment")
//	public String payment() {
//		
//	}
}
