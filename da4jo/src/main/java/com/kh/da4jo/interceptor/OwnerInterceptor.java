package com.kh.da4jo.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.da4jo.dao.NoticeDao;
import com.kh.da4jo.dao.PoDao;
import com.kh.da4jo.dao.QnaDao;
import com.kh.da4jo.dao.ReviewDao;

@Service
public class OwnerInterceptor {
	@Autowired
	private NoticeDao noticeDao;
	@Autowired
	private PoDao poDao;
	@Autowired
	private QnaDao qnaDao;
	@Autowired
	private ReviewDao reviewDao;
	
}
