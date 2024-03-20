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
import com.kh.da4jo.vo.PaymentVO;

import jakarta.servlet.http.HttpSession;
import net.sf.jsqlparser.util.validation.validator.ShowIndexStatementValidator;

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
		String loginId = (String)session.getAttribute("loginId");
		//구매서 테이블에서 구매서 번호로 조회 후 넘겨주기
		PoDto poDto = poDao.selectOne(poNo);
		model.addAttribute("poDto", poDto);
		
		if(poDto.getPoNameEng() != null) { //작성자가 탈퇴하지 않았다면
			MemberDto memberDto = memberDao.selectOne(loginId);//작성자 아이디로 조회
			model.addAttribute("memberDto", memberDto);
		}
		
		return "/WEB-INF/views/member/mypage/purchase/detail.jsp";	
	}
	
	//구매 대행 신청서에 대한 결제 페이지
	@GetMapping("/payment")
	public String payment(Model model, int poNo, HttpSession session) {
		PaymentVO paymentVO = poDao.getPaymentInfo(poNo);
		model.addAttribute("paymentVO", paymentVO);
		
		String loginId = (String)session.getAttribute("loginId");
		MemberDto memberDto = memberDao.selectOne(loginId);
		model.addAttribute("memberDto", memberDto);
		
		return "/WEB-INF/views/member/mypage/purchase/payment.jsp";
		
	}
	//포인트 결제 미구현
	@PostMapping("/payment")
	public String payment(HttpSession session, int poNo, Model model) {
		String loginId = (String)session.getAttribute("loginId");
		MemberDto memberDto = memberDao.selectOne(loginId);
		model.addAttribute("memberDto", memberDto);
		
		PaymentVO paymentVO = poDao.getPaymentInfo(poNo);
		model.addAttribute("paymentVO", paymentVO);
		
		PoDto poDto = poDao.selectOne(poNo);
		
		//결제 진행
		//1.결제 금액과 회원의 돈/포인트 정보 가져오기
		int memberCash = memberDto.getMemberCredit(); //회원 돈
		//int memberPoint = memberDto.getMemberPoint(); //회원 포인트
		int totalPrice = poDto.getPoTotalPriceKrw(); //결제 금액
		
		//2. 결제 금액 
		//boolean isPayment = memberCash - (totalPrice - memberPoint) >= 0;
		boolean isPayment = memberCash - totalPrice >= 0;
		if(isPayment) { //결제가 된다면
			//결제 후 남은 잔액을 기록
			memberDto.setMemberCredit(memberCash - totalPrice);
			//memberDto.setMemberCredit(memberCash - (totalPrice - memberPoint));
			//결제 후 남은 포인트를 기록
			
			//po_status를 결제 완료로 변경
			poDto.setPoStatus("결제완료");
			
			//DB에 저장
			memberDao.updateCredit(memberDto);//크레딧 바꾸는 dao로 추가
			poDao.updateStatus(poDto);
	
			
			return "redirect:paymentFinish";
		}
		else { //잔액이 부족하다면
			return "redirect:/member/credit/charge"; //돈 충전 페이지로 이동
		}
	}
	@RequestMapping("/paymentFinish")
	public String paymentFinsih() {
		return "/WEB-INF/views/member/mypage/purchase/paymentFinish.jsp";
	}
	
	//배송 진행 중인 구매서만 보여질 페이지
	@RequestMapping("/processList")
	public String processList(@ModelAttribute(value = "pageVO") PageVO pageVO, Model model,
							HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		
		int count = poDao.shippingCount(pageVO, loginId);
		System.out.println(count);
		pageVO.setCount(count);
		
		List<PoDto> list = poDao.selectShippingListByPaging(pageVO, loginId);
		model.addAttribute("poList", list);
		
		return "/WEB-INF/views/member/po/processList.jsp";
	}
}
