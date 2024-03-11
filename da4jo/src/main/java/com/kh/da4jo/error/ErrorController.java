package com.kh.da4jo.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice(annotations = {Controller.class})
public class ErrorController
{
	@ExceptionHandler(Exception.class)
	public String handelr(Exception e) {
		e.printStackTrace();
		return "/WEB-INF/views/error.jsp";
	}
}
