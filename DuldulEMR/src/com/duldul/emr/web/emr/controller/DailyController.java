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

import com.duldul.emr.common.bean.PagingBean;
import com.duldul.emr.common.service.IPagingService;
import com.duldul.emr.web.emr.service.IDailyService;


@Controller
public class DailyController {
	@Autowired
	public IDailyService IDailyService;

	@Autowired
	public IPagingService iPagingService;

	//Daily 페이지 연결
	@RequestMapping(value="/Daily")
	public ModelAndView Daily(HttpServletRequest request, ModelAndView modelAndView) {
		
		modelAndView.setViewName("EMR/Daily");
		
		return modelAndView;
	} //Daily 페이지 연결 끝
	
	//Daily_write 페이지 연결
	@RequestMapping(value="/Daily_write")
	public ModelAndView Daily_write(HttpServletRequest request, ModelAndView modelAndView) {
		
		modelAndView.setViewName("EMR/Daily_write");
		
		return modelAndView;
	} //Daily_write 페이지 연결 끝
	
	//Daily_details 페이지 연결
	@RequestMapping(value="/Daily_details")
	public ModelAndView Daily_details(HttpServletRequest request, @RequestParam HashMap<String, String> params, 
										ModelAndView modelAndView) throws Throwable{
		
		HashMap<String, String> cond = IDailyService.getDailyCon(params);
		System.out.println(params);
		System.out.println(cond);
		
		modelAndView.addObject("cond",cond);
		modelAndView.setViewName("EMR/Daily_details");
		
		return modelAndView;
	} //Daily_details 페이지 연결 끝
	
	//직원 데이터 가져오기
	@RequestMapping(value = "/emp_List")
	public @ResponseBody ResponseEntity<String> emp_List(HttpServletRequest request,
			@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		HashMap<String, String> list = IDailyService.getemp_List(params);

		modelMap.put("list", list);

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");

		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	//일일 업무 일지 가져오기
	@RequestMapping(value = "/dailyList")
	public @ResponseBody ResponseEntity<String> dailyList(HttpServletRequest request,
			@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")),
							IDailyService.getDailyCount(params));
		params.put("start", Integer.toString(pb.getStartCount()));
		params.put("end", Integer.toString(pb.getEndCount()));

		ArrayList<HashMap<String, String>> list = IDailyService.getDaily(params);

		modelMap.put("list", list);
		modelMap.put("pb", pb);

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");

		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	//insert
	@RequestMapping(value = "/dailyInsert")
	public @ResponseBody ResponseEntity<String> dailyInsert(HttpServletRequest request,
			@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String res = IDailyService.dailyInsert(params);
		
		modelMap.put("res", res);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");

		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	//update
	@RequestMapping(value = "/dailyUpdate")
	public @ResponseBody ResponseEntity<String> dailyUpdate(HttpServletRequest request,
			@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int res = IDailyService.dailyUpdate(params);
		
		modelMap.put("res", res);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");

		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	//delete
	@RequestMapping(value = "/dailyDelete")
	public @ResponseBody ResponseEntity<String> dailyDelete(HttpServletRequest request,
			@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int ress = IDailyService.dailyDelete(params);
		
		modelMap.put("ress", ress);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");

		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
}