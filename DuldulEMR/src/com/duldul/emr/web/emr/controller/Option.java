package com.duldul.emr.web.emr.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.duldul.emr.web.emr.service.IOptionService;

@Controller
public class Option {

	@Autowired
	public IOptionService iOptionService;
	
	@RequestMapping(value="/adminopt")
	public ModelAndView adminopt(HttpServletRequest request, ModelAndView modelAndView){
		
		modelAndView.setViewName("EMR/admin_opt");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/adminopt_Show_hospital_info")
	public @ResponseBody ResponseEntity<String> adminopt_Show_hospital_info(HttpServletRequest request, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		//ArrayList<HashMap<String, String>> list = iOptionService.getHosinfo();
		
		//modelMap.put("list", list);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	
}
