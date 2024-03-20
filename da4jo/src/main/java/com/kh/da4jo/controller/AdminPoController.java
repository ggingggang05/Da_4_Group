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

import com.kh.da4jo.dao.CreditDao;
import com.kh.da4jo.dao.PoDao;
import com.kh.da4jo.dto.PoDto;
import com.kh.da4jo.vo.PageVO;
import com.kh.da4jo.vo.SettlementVO;



@Controller
@RequestMapping("/admin/po")
public class AdminPoController {
	
	@Autowired
	private PoDao poDao;
	
	
//	@RequestMapping("/orderList")
//	public String orderList(@RequestParam(required = false) String column, @RequestParam(required = false) String keyword,
//			Model model) {
//		// 기본은 목록을 띄워주고 원하면 검색을 할 수 있게 구현
//		boolean isSearch = column != null && keyword != null;
//		// column 값과 keyword 값이 둘다 null이 아닌 경우는 검색 페이지를 보여주는 변수 설정
//		List<PoDto> poList = isSearch ? poDao.selectList(column, keyword) : poDao.selectList();
//		model.addAttribute("poList", poList); // jsp에 list라는 이름으로 매개변수의 값을 객체에 담아 전달
//		return "/WEB-INF/views/admin/po/orderList.jsp";
//	}
	@RequestMapping("/orderList")
	public String orderList(
			@ModelAttribute PageVO pageVO,
			Model model) {
		//세부 계산은 클래스에서 수행하도록 하고 count, list만 처리
		int count = poDao.orderCount(pageVO);
		pageVO.setCount(count);
		model.addAttribute("pageVO", pageVO);
		List<PoDto> poDto = poDao.selectListByOrderListPaging(pageVO);
		model.addAttribute("poDto", poDto);
		
		return "/WEB-INF/views/admin/po/orderList.jsp";
	}
	
	
	
	
	@GetMapping("/orderDetail")
	public String orderDetail(@RequestParam int poNo, Model model) {
		PoDto poDto = poDao.selectOne(poNo);
		model.addAttribute("poDto",poDto);
		return "/WEB-INF/views/admin/po/orderDetail.jsp";
	}
	@PostMapping("/orderDetail")
	public String orderDetail(@ModelAttribute PoDto poDto) {
		poDao.update(poDto);
		return "redirect:orderList";
	}
//	@RequestMapping("/processList")
//	public String processList(@RequestParam(required = false) String column, @RequestParam(required = false) String keyword,
//			Model model) {
//		// 기본은 목록을 띄워주고 원하면 검색을 할 수 있게 구현
//		boolean isSearch = column != null && keyword != null;
//		// column 값과 keyword 값이 둘다 null이 아닌 경우는 검색 페이지를 보여주는 변수 설정
//		List<PoDto> poList = isSearch ? poDao.selectList(column, keyword) : poDao.selectList();
//		model.addAttribute("poList", poList); // jsp에 list라는 이름으로 매개변수의 값을 객체에 담아 전달
//		return "/WEB-INF/views/admin/po/processList.jsp";
//	}
//	
	@RequestMapping("/processList")
	public String processList(
			@ModelAttribute PageVO pageVO,
			Model model) {
		//세부 계산은 클래스에서 수행하도록 하고 count, list만 처리
		int count = poDao.processCount(pageVO);
		pageVO.setCount(count);
		model.addAttribute("pageVO", pageVO);
		List<PoDto> poDto = poDao.selectListByprocessListPaging(pageVO);
		model.addAttribute("poDto", poDto);
		
		return "/WEB-INF/views/admin/po/processList.jsp";
	}
	
	
	@GetMapping("/processDetail")
	public String processDetail(@RequestParam int poNo, Model model) {
		PoDto poDto = poDao.selectOne(poNo);
		model.addAttribute("poDto",poDto);
		return "/WEB-INF/views/admin/po/processDetail.jsp";
	}
	@PostMapping("/processDetail")
	public String processDetail(@ModelAttribute PoDto poDto) {
		poDao.updateAWB(poDto);
		return "redirect:processList";
	}
	



	@RequestMapping("/completeList")
	public String completeList(
			@ModelAttribute PageVO pageVO,
			Model model) {
		//세부 계산은 클래스에서 수행하도록 하고 count, list만 처리
		int count = poDao.completeCount(pageVO);
		pageVO.setCount(count);
		model.addAttribute("pageVO", pageVO);
		List<PoDto> poDto = poDao.selectListBycompleteListPaging(pageVO);
		model.addAttribute("poDto", poDto);
		
		return "/WEB-INF/views/admin/po/completeList.jsp";
	}
	
	
	//일자별 정산 내역 컨트롤러
	@GetMapping("/settlement")
    public String getDailyPayments(Model model) {
		// PoDao에서 일자별 정산 내역 조회
        List<SettlementVO> dailyPayments = poDao.getDailyPayments(); 
        // 모델에 결과 추가
        model.addAttribute("dailyPayments", dailyPayments);
        
        return "/WEB-INF/views/admin/po/settlement.jsp"; 
    }
	
	
}