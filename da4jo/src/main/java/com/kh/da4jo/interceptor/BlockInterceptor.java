package com.kh.da4jo.interceptor;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Service
public class BlockInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String memberBlock = (String)session.getAttribute("memberBlock");
		
		if(memberBlock == "N") {//일반회원
			return true;
		}
		else {//블락회원
			response.sendError(403);
			//response.sendRedirect("/");//어디로 보낼지?
		}
		return false;
	}
	
}
