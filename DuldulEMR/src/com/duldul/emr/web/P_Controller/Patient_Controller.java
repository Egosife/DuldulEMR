package com.duldul.emr.web.P_Controller;

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

import com.duldul.emr.common.bean.PagingBean;
import com.duldul.emr.common.service.IPagingService;
import com.duldul.emr.web.P_Service.Patient_iService;

@Controller
public class Patient_Controller { //2016-11-30 이관우 컨트롤러 작성
	
	@Autowired
	public Patient_iService Patient_iService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/Patient_page") //환자조회
	public ModelAndView EMR_Pat_page(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("EMR/Patient_page");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/Pat_list") //환자리스트 Patient_page(ajax)
	public @ResponseBody ResponseEntity<String> Pat_list(HttpServletRequest request,
			@RequestParam HashMap<String, String> pari,
			ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(pari.get("Pat_page")),
				Patient_iService.Patient_Count(pari));
		
		pari.put("start", Integer.toString(pb.getStartCount()));
		pari.put("end", Integer.toString(pb.getEndCount()));
		
		ArrayList<HashMap<String, String>> list = Patient_iService.patient_DataList(pari);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		HttpHeaders resposeHeaders = new HttpHeaders();
		resposeHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				resposeHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/Sign_up") //환자등록
	public ModelAndView EMR_Sign_up(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("EMR/Patient_sign_up");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/Details") //환자 상세조회
	public ModelAndView EMR_details(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("EMR/Patient_details");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/Emp_page") //직원조회
	public ModelAndView EMR_Emp(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("EMR/Emp_page");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/EMP_list") //직원리스트 Emp_page(ajax)
	public @ResponseBody ResponseEntity<String> EMP_list(HttpServletRequest request,
			@RequestParam HashMap<String, String> parang,
			ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(parang.get("Emp_page")),
				Patient_iService.EMP_Count(parang));
		
		parang.put("start", Integer.toString(pb.getStartCount()));
		parang.put("end", Integer.toString(pb.getEndCount()));
		
		ArrayList<HashMap<String, String>> list = Patient_iService.EMP_DataList(parang);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		HttpHeaders resposeHeaders = new HttpHeaders();
		resposeHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				resposeHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/set") //환자 일정조회
	public ModelAndView EMR_set(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("EMR/Patient_set");
		
		return modelAndView;
	}
}
