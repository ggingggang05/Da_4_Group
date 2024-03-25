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

import com.kh.da4jo.dao.ShipSvcDao;
import com.kh.da4jo.dto.ShipSvcDto;
import com.kh.da4jo.vo.DailyDetailVO;
import com.kh.da4jo.vo.PageVO;
import com.kh.da4jo.vo.SettlementVO;
import com.kh.da4jo.vo.VatListVO;

@Controller
@RequestMapping("/admin/ship")
public class AdminShipSvcController {

	@Autowired
	private ShipSvcDao shipSvcDao;

	@RequestMapping("/orderList")
	public String orderList(@ModelAttribute PageVO pageVO, Model model) {
		// 세부 계산은 클래스에서 수행하도록 하고 count, list만 처리
		int count = shipSvcDao.orderCount(pageVO);
		pageVO.setCount(count);
		model.addAttribute("pageVO", pageVO);
		List<ShipSvcDto> shipSvcDto = shipSvcDao.selectListByOrderListPaging(pageVO);
		model.addAttribute("shipSvcDto", shipSvcDto);

		return "/WEB-INF/views/admin/ship/orderList.jsp";
	}
	
	// 무게당 금액을 업데이트 해서 결제금액을 계산하는 페이지
	@GetMapping("/orderInvoice")
	public String orderInvoice(@RequestParam int shipSvcNo, Model model) {
		ShipSvcDto shipSvcDto = shipSvcDao.selectOne(shipSvcNo);
		model.addAttribute("shipSvcDto", shipSvcDto);
		return "/WEB-INF/views/admin/ship/orderInvoice.jsp";
	}

	@PostMapping("/orderInvoice")
	public String orderInvoice(@ModelAttribute ShipSvcDto shipSvcDto) {
		shipSvcDao.updateInvoice(shipSvcDto);
		return "redirect:orderList";
	}
	
	@GetMapping("/orderCancel")
	public String orderCancel(@RequestParam int shipSvcNo, Model model) {
		model.addAttribute("shipSvcNo", shipSvcNo);
		return "/WEB-INF/views/admin/ship/orderCancel.jsp";
	}
	@PostMapping("/orderCancel")
	public String orderCancel(@RequestParam int shipSvcNo, @RequestParam String shipSvcAdminComment) {
		shipSvcDao.cancelOrder(shipSvcAdminComment, shipSvcNo);
		return "redirect:orderList";
	}
	
	@GetMapping("/orderDetail")
	public String orderDetail(@RequestParam int shipSvcNo, Model model) {
		ShipSvcDto shipSvcDto = shipSvcDao.selectOne(shipSvcNo);
		model.addAttribute("shipSvcDto", shipSvcDto);
		return "/WEB-INF/views/admin/ship/orderDetail.jsp";
	}

	@PostMapping("/orderDetail")
	public String orderDetail(@ModelAttribute ShipSvcDto shipSvcDto) {
		shipSvcDao.sendingInvoice(shipSvcDto);
		return "redirect:orderList";
	}
	

	@RequestMapping("/processList")
	public String processList(@ModelAttribute PageVO pageVO, Model model) {
		// 세부 계산은 클래스에서 수행하도록 하고 count, list만 처리
		int count = shipSvcDao.processCount(pageVO);
		pageVO.setCount(count);
		model.addAttribute("pageVO", pageVO);
		List<ShipSvcDto> shipSvcDto = shipSvcDao.selectListByprocessListPaging(pageVO);
		model.addAttribute("shipSvcDto", shipSvcDto);

		return "/WEB-INF/views/admin/ship/processList.jsp";
	}

	@GetMapping("/processDetail")
	public String processDetail(@RequestParam int shipSvcNo, Model model) {
		ShipSvcDto shipSvcDto = shipSvcDao.selectOne(shipSvcNo);
		model.addAttribute("shipSvcDto", shipSvcDto);
		return "/WEB-INF/views/admin/ship/processDetail.jsp";
	}

	@PostMapping("/processDetail")
	public String processDetail(@ModelAttribute ShipSvcDto shipSvcDto) {
		shipSvcDao.updateAWB(shipSvcDto);
		return "redirect:processList";
	}

	@RequestMapping("/completeList")
	public String completeList(@ModelAttribute PageVO pageVO, Model model) {
		// 세부 계산은 클래스에서 수행하도록 하고 count, list만 처리
		int count = shipSvcDao.completeCount(pageVO);
		pageVO.setCount(count);
		model.addAttribute("pageVO", pageVO);
		List<ShipSvcDto> shipSvcDto = shipSvcDao.selectListBycompleteListPaging(pageVO);
		model.addAttribute("shipSvcDto", shipSvcDto);

		return "/WEB-INF/views/admin/ship/completeList.jsp";
	}

	
	@RequestMapping("/cancelList")
	public String cancelList(
			@ModelAttribute PageVO pageVO,
			Model model) {
		//세부 계산은 클래스에서 수행하도록 하고 count, list만 처리
		int count = shipSvcDao.cancelCount(pageVO);
		pageVO.setCount(count);
		model.addAttribute("pageVO", pageVO);
		List<ShipSvcDto> shipSvcDto = shipSvcDao.selectListByCancelListPaging(pageVO);
		model.addAttribute("shipSvcDto", shipSvcDto);
		
		return "/WEB-INF/views/admin/ship/cancelList.jsp";
	}
	
	
	@GetMapping("/cancelDetail")
	public String cancelDetail(@RequestParam int shipSvcNo, Model model) {
		ShipSvcDto shipSvcDto = shipSvcDao.selectOne(shipSvcNo);
		model.addAttribute("shipSvcDto",shipSvcDto);
		return "/WEB-INF/views/admin/ship/cancelDetail.jsp";
	}
	@PostMapping("/cancelDetail")
	public String cancelDetail(@ModelAttribute ShipSvcDto shipSvcDto) {
		shipSvcDao.updateAWB(shipSvcDto);
		return "redirect:cancelList";
	}
	
	
	@GetMapping("/settlement")
	    public String getDailyPayments(Model model,
	    		@RequestParam(required = false) String startDate,
	    		@RequestParam(required = false) String endDate
	    		) {
			boolean isSearch = startDate != null && endDate != null;
			List<SettlementVO> list;
			if(isSearch) {
				list = shipSvcDao.periodPayments(startDate, endDate);
			}else {
				list = shipSvcDao.getDailyPayments(); 
			}
			model.addAttribute("list", list);
			return "/WEB-INF/views/admin/ship/settlement.jsp";
	}
	//일자별 디테일 상세내역
	@RequestMapping("/dailyDetail")
	public String dailyDetail(Model model, 
			@RequestParam(required = false) String shipSvcPayDate) {
		
		List<DailyDetailVO> list = shipSvcDao.dailyDetail(shipSvcPayDate);
		model.addAttribute("list", list);
		return "/WEB-INF/views/admin/ship/dailyDetail.jsp";
	}
	
	
	//분기별 VAT 내역 컨트롤러
	@RequestMapping("/vatList")
	public String vatList(Model model, @RequestParam(required = false) String year) {
		if(year != null) {
			List<VatListVO> list = shipSvcDao.getVatListByYear(year);
			model.addAttribute("list", list);
		}
		return "/WEB-INF/views/admin/ship/vatList.jsp";
	}
}