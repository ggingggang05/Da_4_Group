package com.kh.da4jo.RestController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.da4jo.dao.NoticeDao;
import com.kh.da4jo.vo.NoticeVO;

@RestController
@RequestMapping("/rest/notice")
public class NoticeRestController {
	
	@Autowired
	private NoticeDao noticeDao;
	 @GetMapping("/list")
	    public List<NoticeVO> getNoticeList(Model model) {
	        return noticeDao.getNoticeList();
	    }
	
}
