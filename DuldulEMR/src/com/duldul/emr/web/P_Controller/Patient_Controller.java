package com.duldul.emr.web.P_Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Patient_Controller {
	
	@RequestMapping(value = "/Patient_page")
	public ModelAndView EMR_Pat_page(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("EMR/Patient_page");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/Sign_up")
	public ModelAndView EMR_Sign_up(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("EMR/Patient_sign_up");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/details")
	public ModelAndView EMR_details(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("EMR/Patient_details");
		
		return modelAndView;
	}
}
