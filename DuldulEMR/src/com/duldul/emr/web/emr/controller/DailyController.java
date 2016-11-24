package com.duldul.emr.web.emr.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DailyController {
	//Daily 페이지 연결
	@RequestMapping(value="/Daily")
	public ModelAndView Daily(HttpServletRequest request, ModelAndView modelAndView) {
		
		modelAndView.setViewName("EMR/Daily");
		
		return modelAndView;
	} //Daily 페이지 연결 끝
	
	//Daily_write 페이지 연결
	@RequestMapping(value="/Daily_write")
	public ModelAndView emrmain(HttpServletRequest request, ModelAndView modelAndView) {
		
		modelAndView.setViewName("EMR/Daily_write");
		
		return modelAndView;
	} //Daily_write 페이지 연결 끝
}
