package com.duldul.emr.web.fancybox.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FancyboxController {
	
	@RequestMapping(value="/fancybox")
	public ModelAndView fancybox(HttpServletRequest request,
ModelAndView modelAndView) {
		
		modelAndView.setViewName("fancybox/fancybox");
		
		return modelAndView;
	}
}
