package com.kh.da4jo.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.da4jo.interceptor.AdminInterceptor;
import com.kh.da4jo.interceptor.BlockInterceptor;
import com.kh.da4jo.interceptor.MemberInterceptor;

@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer{

	@Autowired
	private MemberInterceptor memberInterceptor;
	@Autowired
	private AdminInterceptor adminInterceptor;
	@Autowired
	private BlockInterceptor blockInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//비회원 접근 금지
		registry.addInterceptor(memberInterceptor)
						.addPathPatterns(//인터셉터 적용할 페이지
						"/member/mypge",
						"/board/review/list",
						"/board/qna/**",
						"/board/notice/**"
						)
					.excludePathPatterns(//인터셉터에서 제외할 페이지
				
					);
		//관리자 외 접근 불가
		registry.addInterceptor(adminInterceptor)
						.addPathPatterns(
						"/admin/**",
						"/board/notice/write"
						);
		//블락회원 접근 불가
		registry.addInterceptor(blockInterceptor)
						.addPathPatterns(
						"/board/qna/write",
						"/member/po/request"
						);
	
	}
}
