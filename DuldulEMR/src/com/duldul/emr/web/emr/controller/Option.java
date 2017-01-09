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
import org.springframework.web.bind.annotation.RequestParam;
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
	public @ResponseBody ResponseEntity<String> adminopt_Show_hospital_info(HttpServletRequest request,
																			@RequestParam HashMap<String, String> params,
																			ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		ArrayList<HashMap<String, String>> list = iOptionService.getHosinfo(params);
		modelMap.put("list", list);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	@RequestMapping(value="/adminopt_Show_emp_info")
	public @ResponseBody ResponseEntity<String> adminopt_Show_emp_info(HttpServletRequest request,
																	   @RequestParam HashMap<String, String> params,
																	   ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		ArrayList<HashMap<String, String>> list = iOptionService.getempinfo(params);
		modelMap.put("list", list);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	@RequestMapping(value="/adminopt_updinfo")
	public @ResponseBody ResponseEntity<String> adminopt_updinfo(HttpServletRequest request,
																@RequestParam HashMap<String, String> params,
																ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		HashMap<String, String> obj = iOptionService.getuphosinfo(params);
		modelMap.put("obj", obj);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}

	@RequestMapping(value="/admin_opt_updhosinfo")
	public @ResponseBody ResponseEntity<String> admin_opt_updhosinfo(HttpServletRequest request,
			@RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		System.out.println(params);
		
		int rs = iOptionService.getupdhos(params);
		modelMap.put("rs", rs);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}

	@RequestMapping(value="/admin_opt_crehosin")
	public @ResponseBody ResponseEntity<String> admin_opt_crehosin(HttpServletRequest request,
																	@RequestParam HashMap<String, String> params,
																	ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();

		HashMap<String, String> hosSEQ = iOptionService.getHospitalSEQ();
		
		if(!hosSEQ.isEmpty()){
			params.putAll(hosSEQ);
			String rs = iOptionService.admincrehosin(params);
			modelMap.put("rs", rs);
			System.out.println(params);
		}else{
			modelMap.put("rs", "fail");
		}
		
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/adminopt_position_select")
	public @ResponseBody ResponseEntity<String> adminopt_position_select(HttpServletRequest request,
																	@RequestParam HashMap<String, String> params,
																	ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();

		ArrayList<HashMap<String, String>> list = iOptionService.getposition_select();
		modelMap.put("list", list);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/adminopt_office_select")
	public @ResponseBody ResponseEntity<String> adminopt_office_select(HttpServletRequest request,
																	@RequestParam HashMap<String, String> params,
																	ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();

		ArrayList<HashMap<String, String>> list = iOptionService.getoffice_select();
		modelMap.put("list", list);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/adminopt_level_select")
	public @ResponseBody ResponseEntity<String> adminopt_level_select(HttpServletRequest request,
																	@RequestParam HashMap<String, String> params,
																	ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();

		ArrayList<HashMap<String, String>> list = iOptionService.getlevel_select();
		modelMap.put("list", list);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	
}
