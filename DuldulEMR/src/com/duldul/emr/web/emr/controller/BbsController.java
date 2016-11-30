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
import com.duldul.emr.web.emr.service.IBbsService;


@Controller
public class BbsController {
	
		@Autowired
		public IBbsService iBbsService;
		
		@Autowired
		public IPagingService iPagingService;
		
		//글 상세보기 페이지 연결
		@RequestMapping(value="/bbs_detail")
		public ModelAndView bbs_detail(HttpServletRequest request, ModelAndView modelAndView)throws Throwable {
			
			modelAndView.setViewName("EMR/bbs_detail");
			
			return modelAndView;
		} //글 상세보기 페이지 연결 끝
		
		//사내게시판 페이지 연결
		@RequestMapping(value="/bbs")
		public ModelAndView bbs(HttpServletRequest request, ModelAndView modelAndView)throws Throwable  {
			
			modelAndView.setViewName("EMR/bbs");
			
			return modelAndView;
		}//사내게시판 페이지 연결 끝 
		
		
		//글쓰기 페이지 연결
		@RequestMapping(value="/bbs_write")
		public ModelAndView bbs_write(HttpServletRequest request, ModelAndView modelAndView)throws Throwable  {
			
			modelAndView.setViewName("EMR/bbs_write");
			
			return modelAndView;
		} //글쓰기 페이지 연결 끝
		
		//초기화면 페이지 연결
		@RequestMapping(value="/main_first")
		public ModelAndView main_first(HttpServletRequest request, ModelAndView modelAndView)throws Throwable  {
			
			modelAndView.setViewName("EMR/main_first");
			
			return modelAndView;
		} //초기화면 페이지 연결 끝
		
		//공지사항 페이지 연결
		@RequestMapping(value="/notice")
		public ModelAndView notice(HttpServletRequest request, ModelAndView modelAndView)throws Throwable  {
			
			modelAndView.setViewName("EMR/notice");
			
			return modelAndView;
		} //공지사항 페이지 연결 끝
		
		//휴진신청 작성하는 페이지 연결
		@RequestMapping(value="/rest")
		public ModelAndView rest(HttpServletRequest request, ModelAndView modelAndView)throws Throwable  {
			
			modelAndView.setViewName("EMR/rest");
			
			return modelAndView;
		} //휴진신청 작성하는 페이지 연결 끝
		
		//나의 휴진 신청현황 및 휴진현황 페이지 연결
		@RequestMapping(value="/rest_apply")
		public ModelAndView rest_apply(HttpServletRequest request, ModelAndView modelAndView)throws Throwable  {
			
			modelAndView.setViewName("EMR/rest_apply");
			
			return modelAndView;
		} //나의 휴진 신청현황 및 휴진현황 페이지 연결 끝
		
		//관리자가 휴진 신청 승인 및 미승인 하는 페이지 연결
		@RequestMapping(value="/rest_apply_confirm")
		public ModelAndView rest_apply_confirm(HttpServletRequest request, ModelAndView modelAndView)throws Throwable  {
			
			modelAndView.setViewName("EMR/rest_apply_confirm");
			
			return modelAndView;
		} 		//관리자가 휴진 신청 승인 및 미승인 하는 페이지 연결
		
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		@RequestMapping(value="/refreshTest")
		public @ResponseBody ResponseEntity<String> refreshTest(
				HttpServletRequest request, 
				@RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable{
			
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), iBbsService.getBbsCount(params));
			
			params.put("start", Integer.toString(pb.getStartCount()));
			params.put("end", Integer.toString(pb.getEndCount()));
			
			ArrayList<HashMap<String, String>> list
						= iBbsService.getBbs(params);
			
			modelMap.put("list",list);
			modelMap.put("pb",pb);
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type","text/json; charset=UTF-8");
			
			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
					responseHeaders,HttpStatus.CREATED);
	}
	
}
