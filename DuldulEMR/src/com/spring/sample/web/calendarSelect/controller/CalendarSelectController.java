package com.spring.sample.web.calendarSelect.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalendarSelectController {
	
	@RequestMapping(value="/calendarSelect")
	public ModelAndView calendarSelect(HttpServletRequest request, ModelAndView modelAndView) {
		
		modelAndView.setViewName("calendarSelect/calendarSelect");
		
		return modelAndView;
	}
}
