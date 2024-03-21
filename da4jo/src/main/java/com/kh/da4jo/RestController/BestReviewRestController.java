package com.kh.da4jo.RestController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.da4jo.dao.ReviewDao;
import com.kh.da4jo.vo.BestReviewVO;

@RestController
@RequestMapping("/rest")
public class BestReviewRestController
{
	@Autowired
	ReviewDao reviewDao;
	
	@GetMapping("/best-review")
	public List<BestReviewVO> getBestReviews() {
		return reviewDao.getBestReview();
	}
}
