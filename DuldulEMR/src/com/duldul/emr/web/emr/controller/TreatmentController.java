package com.duldul.emr.web.emr.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TreatmentController {

	//치료실시입력 연결 start
	@RequestMapping(value="/treatment")
	public ModelAndView treatment(HttpServletRequest request,
			ModelAndView modelAndView) {
		
		modelAndView.setViewName("EMR/treatmentinput");
		
		return modelAndView;
	}
	//치료실시입력 연결 end

	//환자접수 연결 start
	@RequestMapping(value="/reception")
	public ModelAndView reception(HttpServletRequest request,
			ModelAndView modelAndView) {
		
		modelAndView.setViewName("EMR/reception");
		
		return modelAndView;
	}
	//환자접수 연결 end
}
