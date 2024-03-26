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

import com.kh.da4jo.dao.PoDao;
import com.kh.da4jo.dto.PoDto;
import com.kh.da4jo.vo.DailyDetailVO;
import com.kh.da4jo.vo.PageVO;
import com.kh.da4jo.vo.SettlementVO;
import com.kh.da4jo.vo.VatListVO;

import jakarta.servlet.http.HttpSession;

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
	public String orderList(@ModelAttribute PageVO pageVO, Model model) {
		// 세부 계산은 클래스에서 수행하도록 하고 count, list만 처리
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
		model.addAttribute("poDto", poDto);
		return "/WEB-INF/views/admin/po/orderDetail.jsp";
	}

	@PostMapping("/orderDetail")
	public String orderDetail(@ModelAttribute PoDto poDto) {
		poDao.update(poDto);
		return "redirect:orderList";
	}
	
	@GetMapping("/orderCancel")
	public String orderCancel(@RequestParam int poNo, Model model) {
		model.addAttribute("poNo", poNo);
		return "/WEB-INF/views/admin/po/orderCancel.jsp";
	}
	@PostMapping("/orderCancel")
	public String orderCancel(@RequestParam int poNo, @RequestParam String poAdminComment) {
		poDao.cancelOrder(poAdminComment, poNo);
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
	public String processList(@ModelAttribute PageVO pageVO, Model model) {
		// 세부 계산은 클래스에서 수행하도록 하고 count, list만 처리
		int count = poDao.processCount(pageVO);
		pageVO.setCount(count);
		model.addAttribute("pageVO", pageVO);
		List<PoDto> poDto = poDao.selectListByprocessListPaging(pageVO);
		model.addAttribute("poDto", poDto);

		return "/WEB-INF/views/admin/po/processList.jsp";
	}
	
	//배송 진행 중인 구매서만 보여질 페이지
	@GetMapping("/processingList")
	public String processingList(@ModelAttribute(value = "pageVO") PageVO pageVO, Model model) {
		int count = poDao.shippingProcessCount(pageVO);
		pageVO.setCount(count);
		model.addAttribute("pageVO", pageVO);
		
		List<PoDto> list = poDao.selectShippingProcessListByPaging(pageVO);
		model.addAttribute("poList", list);
		
		return "/WEB-INF/views/admin/po/processingList.jsp";
	}
	@PostMapping("/processingList")
	public String processingList(@ModelAttribute PoDto poDto) {
		System.out.println(poDto);
		poDao.updateStatus(poDto.getPoStatus(), poDto.getPoNo());
		
		return "redirect:processingList";
	}

	@GetMapping("/processDetail")
	public String processDetail(@RequestParam int poNo, Model model) {
		PoDto poDto = poDao.selectOne(poNo);
		model.addAttribute("poDto", poDto);
		return "/WEB-INF/views/admin/po/processDetail.jsp";
	}

	@PostMapping("/processDetail")
	public String processDetail(@ModelAttribute PoDto poDto) {
		poDao.updateAWB(poDto);
		return "redirect:processList";
	}

	@RequestMapping("/completeList")
	public String completeList(@ModelAttribute PageVO pageVO, Model model) {
		// 세부 계산은 클래스에서 수행하도록 하고 count, list만 처리
		int count = poDao.completeCount(pageVO);
		pageVO.setCount(count);
		model.addAttribute("pageVO", pageVO);
		List<PoDto> poDto = poDao.selectListBycompleteListPaging(pageVO);
		model.addAttribute("poDto", poDto);

		return "/WEB-INF/views/admin/po/completeList.jsp";
	}
	@GetMapping("/completeDetail")
	public String completeDetail(@RequestParam int poNo, Model model) {
		PoDto poDto = poDao.selectOne(poNo);
		model.addAttribute("poDto", poDto);
		return "/WEB-INF/views/admin/po/completeDetail.jsp";
	}

	
	@RequestMapping("/cancelList")
	public String cancelList(
			@ModelAttribute PageVO pageVO,
			Model model) {
		//세부 계산은 클래스에서 수행하도록 하고 count, list만 처리
		int count = poDao.cancelCount(pageVO);
		pageVO.setCount(count);
		model.addAttribute("pageVO", pageVO);
		List<PoDto> poDto = poDao.selectListByCancelListPaging(pageVO);
		model.addAttribute("poDto", poDto);
		
		return "/WEB-INF/views/admin/po/cancelList.jsp";
	}
	
	
	@GetMapping("/cancelDetail")
	public String cancelDetail(@RequestParam int poNo, Model model) {
		PoDto poDto = poDao.selectOne(poNo);
		model.addAttribute("poDto",poDto);
		return "/WEB-INF/views/admin/po/cancelDetail.jsp";
	}
//	@PostMapping("/cancelDetail")
//	public String cancelDetail(@ModelAttribute PoDto poDto) {
//		poDao.updateAWB(poDto);
//		return "redirect:cancelList";
//	}
//	
	
	@GetMapping("/settlement")
	    public String getDailyPayments(Model model,
	    		@RequestParam(required = false) String startDate,
	    		@RequestParam(required = false) String endDate
	    		) {
			boolean isSearch = startDate != null && endDate != null;
			List<SettlementVO> list;
			if(isSearch) {
				list = poDao.periodPayments(startDate, endDate);
			}else {
				list = poDao.getDailyPayments(); 
			}
			model.addAttribute("list", list);
			return "/WEB-INF/views/admin/po/settlement.jsp";
	}
	//일자별 디테일 상세내역
	@RequestMapping("/dailyDetail")
	public String dailyDetail(Model model, 
			@RequestParam(required = false) String poPayDate) {
		
		List<DailyDetailVO> list = poDao.dailyDetail(poPayDate);
		model.addAttribute("list", list);
		return "/WEB-INF/views/admin/po/dailyDetail.jsp";
	}
	
	
	//분기별 VAT 내역 컨트롤러
	@RequestMapping("/vatList")
	public String vatList(Model model, @RequestParam(required = false) String year) {
		if(year != null) {
			List<VatListVO> list = poDao.getVatListByYear(year);
			model.addAttribute("list", list);
		}
		return "/WEB-INF/views/admin/po/vatList.jsp";
	}
}