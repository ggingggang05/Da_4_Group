package com.kh.da4jo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.da4jo.dao.ReviewDao;
import com.kh.da4jo.dto.ReviewDto;
import com.kh.da4jo.service.ImgService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class ReviewController {

	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private ImgService imgService;
	
	//리뷰 글 작성
	@GetMapping("/review/write")
		public String write() {
		return "/WEB-INF/views/board/review/write.jsp";
	}

	@PostMapping("/review/write")
	public String write(@ModelAttribute ReviewDto reviewDto, HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		reviewDto.setReviewWriter(loginId);
		
		int sequence = reviewDao.getSequence();
		reviewDto.setReviewNo(sequence);
		reviewDao.insert(reviewDto);
		
//		if(!img.isEmpty()) {
//			int imgNo = imgService.save(img);
//			
//			//연결
//			reviewDao.connect(reviewNo, imgNo);
//		}
//		
		return "redirect:detail?reviewNo="+sequence;

	}
	
	
	//리뷰 목록
	@RequestMapping("/review/list")
	public String list(@RequestParam(required = false) String column,
							@RequestParam(required = false) String keyword, Model model) {
		boolean isSearch = column != null && keyword != null;
		if(isSearch) {
			model.addAttribute("list", reviewDao.selectList(column, keyword));
		}
		else {
			model.addAttribute("list", reviewDao.selectList());
		}
		
		return "/WEB-INF/views/board/review/list.jsp";
	}

	
	@RequestMapping("/review/detail")
	public String detail(@RequestParam int reviewNo, Model model) {
		ReviewDto reviewDto = reviewDao.selectOne(reviewNo);
		model.addAttribute("reviewDto", reviewDto);
		
		return "/WEB-INF/views/board/review/detail.jsp";
	}
	
	
	//수정
	@GetMapping("/review/edit") 
	public String edit(@RequestParam int reviewNo, Model model) {
		ReviewDto reviewDto = reviewDao.selectOne(reviewNo);
		model.addAttribute("reviewDto", reviewDto);
		return "/WEB-INF/views/board/review/edit.jsp";
	}
	
	@PostMapping("/review/edit")
	public String edit(@ModelAttribute ReviewDto reviewDto) {
		reviewDao.update(reviewDto);
		return "redirect:detail?reviewNo=" + reviewDto.getReviewNo();
	}
	
	
	//삭제
	@RequestMapping("/review/delete")
	public String delete(@RequestParam int reviewNo) {
		reviewDao.delete(reviewNo);
		return "redirect:/board/review/list";
	}
	
	//이미지
	//	@RequestMapping("/image")
	//	public String image(HttpSession session) {
	//		try {
	//			int attachNo = reviewDao.();
	//			return "redirect:/download?attachNo="+attachNo;
	//		}
	//		catch(Exception e) {
	//			return "redirect:/image/user.png";
	//		}
	//	}
	
}
