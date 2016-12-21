package com.duldul.emr.web.emr.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class ManagerController {
/*	@Autowired
	public IManService iManService;
*/
	@RequestMapping(value="/manager_opt")
	public ModelAndView manager_opt(HttpServletRequest request, ModelAndView modelAndView){
		
		modelAndView.setViewName("EMR/manager_opt");
		
		return modelAndView;
	}
}
