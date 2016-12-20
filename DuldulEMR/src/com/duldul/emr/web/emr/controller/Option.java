package com.duldul.emr.web.emr.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Option {

	@RequestMapping(value="/adminopt")
	public ModelAndView adminopt(HttpServletRequest request, ModelAndView modelAndView){
		
		modelAndView.setViewName("EMR/admin_opt");
		
		return modelAndView;
	}
	
}
