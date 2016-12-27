package com.duldul.emr.web.emr.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.duldul.emr.common.bean.PagingBean;
import com.duldul.emr.common.service.IPagingService;
import com.duldul.emr.web.emr.service.IManService;

@Controller
public class ManagerController {
	@Autowired
	public IManService iManService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/manager_opt")
	public ModelAndView manager_opt(HttpServletRequest request, ModelAndView modelAndView){
		
		modelAndView.setViewName("EMR/manager_opt");
		
		return modelAndView;
	}
	@RequestMapping(value = "/Man_Emp_List")
	public @ResponseBody ResponseEntity<String> Man_Emp_List(HttpServletRequest request, HttpSession session,
			@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")),
						iManService.getManCount(params));
		params.put("start", Integer.toString(pb.getStartCount()));
		params.put("end", Integer.toString(pb.getEndCount()));

		ArrayList<HashMap<String, String>> list = iManService.ManEmpList(params);
		System.out.println(list);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");

		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
}
