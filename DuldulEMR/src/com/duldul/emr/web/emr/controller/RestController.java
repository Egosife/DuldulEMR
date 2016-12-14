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
import com.duldul.emr.web.emr.service.IRestService;

@Controller
public class RestController {
	
	@Autowired
	public IRestService IRestService;
	
	@Autowired
	public IPagingService iPagingService;
	
	//휴진 현황 페이지 연결
	@RequestMapping(value="/rest_apply")
	public ModelAndView rest_apply(HttpServletRequest request, ModelAndView modelAndView)throws Throwable  {
		
		modelAndView.setViewName("EMR/rest_apply");
		
		return modelAndView;
	} //휴진 현황 페이지 연결 끝
	
	//휴진신청 작성하는 페이지 연결
	@RequestMapping(value="/rest")
	public ModelAndView rest(HttpServletRequest request, ModelAndView modelAndView)throws Throwable  {
		
		modelAndView.setViewName("EMR/rest");
		
		return modelAndView;
	} //휴진신청 작성하는 페이지 연결 끝
	
	//insert
	@RequestMapping(value = "/restInsert")
	public @ResponseBody ResponseEntity<String> restInsert(HttpServletRequest request,
			@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String res = IRestService.restInsert(params);
		
		System.out.println(params);
		System.out.println(res);
		
		modelMap.put("res", res);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");

		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	//관리자가 휴진 신청 승인 및 미승인 하는 페이지 연결
	@RequestMapping(value="/rest_apply_confirm")
	public ModelAndView rest_apply_confirm(HttpServletRequest request, ModelAndView modelAndView)throws Throwable  {
		
		modelAndView.setViewName("EMR/rest_apply_confirm");
		
		return modelAndView;
	} 		//관리자가 휴진 신청 승인 및 미승인 하는 페이지 연결
	
	//나의 신청 및 현황 기록
	@RequestMapping(value = "/my_rest_List")
	public @ResponseBody ResponseEntity<String> my_rest_List(HttpServletRequest request, HttpSession session,
			@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")),
						IRestService.getRestCount(params));
		params.put("start", Integer.toString(pb.getStartCount()));
		params.put("end", Integer.toString(pb.getEndCount()));
		
		
		ArrayList<HashMap<String, String>> list = IRestService.getRest(params);

		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");

		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	@RequestMapping(value = "/Emp_rest")
	public @ResponseBody ResponseEntity<String> Emp_rest(HttpServletRequest request, HttpSession session,
			@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")),
						IRestService.getRestCount(params));
		params.put("start", Integer.toString(pb.getStartCount()));
		params.put("end", Integer.toString(pb.getEndCount()));

		ArrayList<HashMap<String, String>> list = IRestService.getRestList(params);

		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");

		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
}