package com.kh.da4jo.interceptor;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class AdminInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String loginLevel = (String)session.getAttribute("loginLevel");
		
		boolean isAdmin = loginLevel != null && loginLevel.equals("관리자") || loginLevel.equals("총관리자");
		
		if(isAdmin) {
			return true;
		}
		else {
			response.sendError(403);
			return false;
		}
	}
	

}
