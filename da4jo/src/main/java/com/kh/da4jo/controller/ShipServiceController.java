package com.kh.da4jo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.da4jo.dao.ShipSvcDao;
import com.kh.da4jo.dto.ShipSvcDto;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member/ship")
public class ShipServiceController {

	@Autowired
	private ShipSvcDao shipSvcDao;
	
	
	// 주문서 작성
	@GetMapping("/request")
	public String request() {
		return "/WEB-INF/views/member/ship/request.jsp";
	}
	@PostMapping("/request")
	public String request(@ModelAttribute ShipSvcDto shipSvcDto, HttpSession session) {
		// 세션에서 로그인 한 사용자 ID 추출
		String loginId = (String)session.getAttribute("loginId");
		// 아이디를 PO테이블에 저장
		shipSvcDto.setShipSvcCustomerId(loginId);
		int sequence = shipSvcDao.getSequence(); // 시퀀스 정보도 PO로 넘겨주기
		shipSvcDto.setShipSvcNo(sequence);
		shipSvcDao.insert(shipSvcDto);
		return "redirect:/member/mypage";
	}
}
