package com.duldul.emr.web.emr.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogonController {
	//Logon 페이지 연결
	@RequestMapping(value="/Logon")
	public ModelAndView Logon(HttpServletRequest request, ModelAndView modelAndView) {
		
		modelAndView.setViewName("EMR/Logon");
		
		return modelAndView;
	} //Logon 페이지 연결 끝
}
