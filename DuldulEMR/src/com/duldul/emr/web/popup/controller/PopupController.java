package com.duldul.emr.web.popup.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PopupController {
	
	@RequestMapping(value="/popup")
	public ModelAndView calendarSelect(HttpServletRequest request, ModelAndView modelAndView) {
		
		modelAndView.setViewName("popup/popup");
		
		return modelAndView;
	}
}
