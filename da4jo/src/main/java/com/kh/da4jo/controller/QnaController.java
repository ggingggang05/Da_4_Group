package com.kh.da4jo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.da4jo.dao.QnaDao;

@Controller
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired
	private QnaDao qnaDao;
	
	//글 작성
	//@GetMapping("/write")		
	//@PostMapping("/write")
	

	//목록 및 상세
	//@RequestMapping("list")
	
	
	//@RequestMapping("detail")

	//수정 [관리자]
	//@GetMapping("/edit")	
	//@PostMapping("/edit")
	
	//삭제 []
	//@RequestMapping("/delete")
	

}
