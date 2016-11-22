package com.duldul.emr.web.dwrTest.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DwrTestController {
	@RequestMapping(value="/dwrTest")
	public ModelAndView dwrTest(HttpServletRequest request, ModelAndView modelAndView) {
		
		modelAndView.setViewName("dwrTest/dwrTest");
		
		return modelAndView;
	}
}
