package com.duldul.emr.web.emr.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	//메인화면 연결 start
	@RequestMapping(value="/emrmain")
	public ModelAndView emrmain(HttpServletRequest request,
			HttpSession session,
			ModelAndView modelAndView) {

		if(session.getAttribute("sEmp_Num") != null){
			modelAndView.setViewName("EMR/main");
		}else{
			modelAndView.setViewName("redirect:Logon");
		}
		return modelAndView;
	}
	//메인화면 연결 end

	//빈화면 연결 start
	@RequestMapping(value="/clear")
	public ModelAndView clear(HttpServletRequest request,
			ModelAndView modelAndView) {
		
			modelAndView.setViewName("EMR/clear");
			
		return modelAndView;
	}
	//빈화면 연결 end
	
	//메인화면 로그아웃 버튼
	@RequestMapping(value="/Logoff")
	public ModelAndView testLogout(HttpServletRequest request,
								   HttpSession session,
								   ModelAndView modelAndView){
		session.invalidate();
		
		modelAndView.setViewName("redirect:Logon");
		
		return modelAndView;
	}//메인화면 로그아웃 버튼 end
	
	
	
	
	
	
	
	//윤희상  사내게시판 연결 start
	@RequestMapping(value="/bbs")
	public ModelAndView bbs1122(HttpServletRequest request,
			ModelAndView modelAndView) {
		
		
		modelAndView.setViewName("EMR/bbs");
		
		return modelAndView;
	}
	//윤희상  사내게시판 연결 end
	
	//윤희상  공지사항 연결 start
		@RequestMapping(value="/notice")
		public ModelAndView notice(HttpServletRequest request,
				ModelAndView modelAndView) {
			
			
			modelAndView.setViewName("EMR/notice");
			
			return modelAndView;
		}
		//윤희상  공지사항 연결 end
		
		//윤희상  공지사항 연결 start
		@RequestMapping(value="/bbs_write")
		public ModelAndView bbs_write(HttpServletRequest request,
				ModelAndView modelAndView) {
			
			
			modelAndView.setViewName("EMR/bbs_write");
			
			return modelAndView;
		}
		//윤희상  공지사항 연결 end
		
		//윤희상 휴진신청 연결 start
				@RequestMapping(value="/rest")
				public ModelAndView rest(HttpServletRequest request,
						ModelAndView modelAndView) {
					
					
					modelAndView.setViewName("EMR/rest");
					
					return modelAndView;
				}
				//윤희상 휴진신청 연결 end
}
