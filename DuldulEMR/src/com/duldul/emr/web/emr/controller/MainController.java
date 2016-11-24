package com.duldul.emr.web.emr.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	//메인화면 연결 start
	@RequestMapping(value="/emrmain")
	public ModelAndView emrmain(HttpServletRequest request,
			ModelAndView modelAndView) {
		
		modelAndView.setViewName("EMR/main");
		
		return modelAndView;
	}
	//메인화면 연결 end
	
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
