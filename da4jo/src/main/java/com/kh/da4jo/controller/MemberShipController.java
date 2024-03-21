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
import com.kh.da4jo.dao.ShipSvcDao;
import com.kh.da4jo.dto.MemberDto;
import com.kh.da4jo.dto.ShipSvcDto;
import com.kh.da4jo.vo.PageVO;
import com.kh.da4jo.vo.ShipPaymentVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member/mypage/ship")
public class MemberShipController {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private ShipSvcDao shipSvcDao;
	
	//배송 대행 모든 신청 목록
	@RequestMapping("/list")
	public String liString(@ModelAttribute(value = "pageVO") PageVO pageVO, Model model,
						HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		
		int count = shipSvcDao.userListCount(pageVO, loginId);
		pageVO.setCount(count);
		
		List<ShipSvcDto> dataList = shipSvcDao.selectList(loginId);
		shipSvcDao.compareDate(dataList);
		
		List<ShipSvcDto> list = shipSvcDao.selectListByPaging(pageVO, loginId);
		model.addAttribute("shipList", list);
		
		return "/WEB-INF/views/member/mypage/ship/list.jsp";
	}
	
	//배송 대행서 상세
	@RequestMapping("/detail")
	public String detail(@RequestParam int shipSvcNo, Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		
		ShipSvcDto shipSvcDto = shipSvcDao.selectOne(shipSvcNo);
		model.addAttribute("shipSvcDto", shipSvcDto);
		
		if(shipSvcDto.getShipSvcCustomerId() != null) { //작성자가 탈퇴하지 않았다면
			MemberDto memberDto = memberDao.selectOne(loginId);
			model.addAttribute("memberDto", memberDto);
		}
		
		return "/WEB-INF/veiws/member/mypage/ship/detail.jsp";
	}
	
	//배송 중인 구매서만 보여질 페이지
	@RequestMapping("/processList")
	public String processList(@ModelAttribute(value="pageVO") PageVO pageVO, Model model, HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		
		int count = shipSvcDao.shippingCount(pageVO, loginId);
		pageVO.setCount(count);
		
		List<ShipSvcDto> list = shipSvcDao.selectShippingListByPaging(pageVO, loginId);
		model.addAttribute("shipList", list);
	
		return "/WEB-INF/views/member/ship/processList.jsp";
	}
	
	//주문정보 확인 중, 결제 대기 중인 구매서만 보여질 페이지
	@RequestMapping("/pendingPayment")
	public String pendingPayment(@ModelAttribute(value = "pageVO") PageVO pageVO, Model model,
				HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");

		int count = shipSvcDao.pendingPaymentCount(pageVO, loginId);
		pageVO.setCount(count);

		List<ShipSvcDto> list = shipSvcDao.selectpendingPaymentListByPaging(pageVO, loginId);
		model.addAttribute("shipList", list);

		return "/WEB-INF/views/member/ship/pendingPayment.jsp";
	}
	
	//주문 취소
	@RequestMapping("/updateCancelStatus")
	public String delete(@RequestParam int shipSvcNo) {
		//주문 취소 버튼을 누른 경우
		shipSvcDao.updateCancelStatus(shipSvcNo); //상태 업데이트
		return "redirect:list";
	}
	
	//배송 대행 신청서에 대한 결제 페이지
	@GetMapping("/payment")
	public String payment(Model model, int shipSvcNo, HttpSession session) {
		ShipPaymentVO paymentVO = shipSvcDao.getPaymentInfo(shipSvcNo);
		model.addAttribute("paymentVO", paymentVO);
		
		String loginId = (String)session.getAttribute("loginId");
		MemberDto memberDto = memberDao.selectOne(loginId);
		model.addAttribute("memberDto", memberDto);
		
		return "/WEB-INF/views/member/mypage/ship/payment.jsp";
		
	}
	@PostMapping("/payment")
	public String payment(HttpSession session, int shipSvcNo, Model model) {
		String loginId = (String)session.getAttribute("loginId");
		MemberDto memberDto = memberDao.selectOne(loginId);
		model.addAttribute("memberDto", memberDto);
		
		ShipPaymentVO paymentVO = shipSvcDao.getPaymentInfo(shipSvcNo);
		model.addAttribute("paymentVO", paymentVO);
		
		ShipSvcDto shipSvcDto = shipSvcDao.selectOne(shipSvcNo);
		
		//결제 진행
		//1.결제 금액과 회원의 돈/포인트 정보 가져오기
		int memberCash = memberDto.getMemberCredit(); //회원 돈
		//int memberPoint = memberDto.getMemberPoint(); //회원 포인트
		int totalPrice = shipSvcDto.getShipSvcTotalPriceKrw(); //결제 금액
		
		//2. 결제 금액 
		//boolean isPayment = memberCash - (totalPrice - memberPoint) >= 0;
		boolean isPayment = memberCash - totalPrice >= 0;
		if(isPayment) { //결제가 된다면
			//결제 후 남은 잔액을 기록
			memberDto.setMemberCredit(memberCash - totalPrice);
			//memberDto.setMemberCredit(memberCash - (totalPrice - memberPoint));
			
			//po_status를 결제 완료로 변경
			shipSvcDto.setShipSvcStatus("결제완료");
			
			//DB에 저장
			memberDao.updateCredit(memberDto);//크레딧 바꾸는 dao로 추가
			shipSvcDao.updateStatus(shipSvcDto);
	
			
			return "redirect:paymentFinish";
		}
		else { //잔액이 부족하다면
			return "redirect:/member/credit/charge"; //돈 충전 페이지로 이동
		}
	}
	@RequestMapping("/paymentFinish")
	public String paymentFinsih() {
		return "/WEB-INF/views/member/mypage/ship/paymentFinish.jsp";
	}
}
