package com.duldul.emr.web.emr.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	//메인화면 연결 start
	@RequestMapping(value="/emrmain")
	public ModelAndView emrmain(HttpServletRequest request,
			ModelAndView modelAndView) {
		
		modelAndView.setViewName("EMR/main");
		
		return modelAndView;
	}
	//메인화면 연결 end
}
