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
	//직원 데이터 가져오기
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
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");

		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	//병원 데이터 가져오기
	@RequestMapping(value = "/Man_jinryo_list")
	public @ResponseBody ResponseEntity<String> Man_jinryo_list(HttpServletRequest request, HttpSession session,
			@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		ArrayList<HashMap<String, String>> list = iManService.Manjinryolist(params);
		
		modelMap.put("list", list);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	@RequestMapping(value = "/Man_jinryo_list2")
	public @ResponseBody ResponseEntity<String> Man_jinryo_list2(HttpServletRequest request, HttpSession session,
			@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		HashMap<String, String> list = iManService.Manjinryolist2(params);
		
		modelMap.put("list", list);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	//병원 진료 정보 수정
	@RequestMapping(value = "/Manopt_sujeong")
	public @ResponseBody ResponseEntity<String> Manopt_sujeong(HttpServletRequest request,
			@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int res = iManService.Manopt_sujeong(params);
		
		modelMap.put("res", res);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");

		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	@RequestMapping(value = "/Man_sayoung")
	public @ResponseBody ResponseEntity<String> Man_sayoung(HttpServletRequest request,
			@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int res = iManService.Man_sayoung(params);
		if(res == 1){
			HashMap<String, String> rs = iManService.actcheck(params);
				modelMap.put("rs", rs);
		}
		modelMap.put("res", "0");
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");

		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/Man_Reset")
	public @ResponseBody ResponseEntity<String> Man_Reset(HttpServletRequest request,
			@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int res = iManService.Man_Reset(params);
		modelMap.put("res", res);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	@RequestMapping(value="/Manager_popup_check")
	public @ResponseBody ResponseEntity<String> Manager_popup_check(HttpServletRequest request,
			@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		int res = iManService.Manager_popup_check(params);
		modelMap.put("res", res);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	//계정 등록
	@RequestMapping(value = "/man_admin_opt")
	public @ResponseBody ResponseEntity<String> man_admin_opt(HttpServletRequest request,
			@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String res = iManService.man_admin_opt(params);
		
		modelMap.put("res", res);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");

		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
}
