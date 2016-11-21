package com.spring.sample.web.zoom.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ZoomController {
	
	@RequestMapping(value="/zoom")
	public ModelAndView zoom2(HttpServletRequest request, ModelAndView modelAndView) {
		
		modelAndView.setViewName("zoom/zoom");
		
		return modelAndView;
	}
}
