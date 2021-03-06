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
import com.duldul.emr.web.emr.service.IBbsService;


@Controller
public class BbsController {
	
		@Autowired
		public IBbsService iBbsService;
		
		@Autowired
		public IPagingService iPagingService;


		
		//공지사항 글 상세보기 페이지 연결
		@RequestMapping(value="/bbs_detail")
		public ModelAndView bbs_detail(HttpServletRequest request,
				@RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable{
			
			HashMap<String, String> con = iBbsService.getBbsCon(params);
			
			System.out.println("asdsadsadadsadadsadsad===> "+con);
			//bbs_detail을 클릭했을시 아예 조회수 +1을 해준다
			int res = iBbsService.visit(params);
			System.out.println(params);
			
			modelAndView.addObject("con",con);
			modelAndView.setViewName("EMR/bbs_detail");
			
			return modelAndView;
			
		} //사내게시판 글 상세보기 페이지 연결 끝
		@RequestMapping(value="/bbs_detail2")
		public ModelAndView bbs_detail2(HttpServletRequest request,
				@RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable{
			
			HashMap<String, String> con = iBbsService.getBbsCon(params);
			
			System.out.println("asdsadsadadsadadsadsad===> "+con);
			//bbs_detail을 클릭했을시 아예 조회수 +1을 해준다
			int res = iBbsService.visit(params);
			System.out.println(params);
			
			modelAndView.addObject("con",con);
			modelAndView.setViewName("EMR/bbs_detail2");
			
			return modelAndView;
		}
		/*@RequestMapping(value="/visit")
		public @ResponseBody ResponseEntity<String> visit(
				HttpServletRequest request, 
				@RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable{
			
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			int res = iBbsService.visit(params);
			
			modelMap.put("res", res);
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type","text/json; charset=UTF-8");
			
			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
					responseHeaders,HttpStatus.CREATED);
		}*/

		
		
		//사내게시판 페이지 연결
		@RequestMapping(value="/bbs")
		public ModelAndView bbs(HttpServletRequest request, ModelAndView modelAndView)throws Throwable  {
			//사내게시판 1번이니깐 1번으로 보이게
			modelAndView.addObject("gbn", 1);
			modelAndView.setViewName("EMR/bbs");
			
			return modelAndView;
		}//사내게시판 페이지 연결 끝 
		
		
		
		
		//공지사항 글쓰기 페이지 연결
		@RequestMapping(value="/bbs_write")
		public ModelAndView bbs_write(HttpServletRequest request, ModelAndView modelAndView)throws Throwable  {
			
			modelAndView.setViewName("EMR/bbs_write");
			
			return modelAndView;
		} //공지사항 글쓰기 페이지 연결 끝
		
		//글쓰기 페이지 연결
		
		//사내게시판 글쓰기 페이지 연결
		@RequestMapping(value="/bbs_write2")
		public ModelAndView bbs_write2(HttpServletRequest request, ModelAndView modelAndView)throws Throwable  {
			
			modelAndView.setViewName("EMR/bbs_write2");
			
			return modelAndView;
		} //사내게시판글쓰기 페이지 연결 끝
		
	
		
		//초기화면에서 휴진현황 페이지 연결
		@RequestMapping(value="/rest_apply2")
		public ModelAndView rest_apply(HttpServletRequest request, ModelAndView modelAndView)throws Throwable  {
			
			modelAndView.setViewName("EMR/rest_apply");
			
			return modelAndView;
		} 		//초기화면에서 휴진현황 페이지 연결 끝
		
		//초기화면 페이지 연결
		@RequestMapping(value="/main_first")
		public ModelAndView main_first(HttpServletRequest request, ModelAndView modelAndView)throws Throwable  {
			modelAndView.addObject("gbn", 0);
			modelAndView.setViewName("EMR/main_first");
			
			return modelAndView;
		} //초기화면 페이지 연결 끝
		
		//공지사항 페이지 연결
		@RequestMapping(value="/notice")
		public ModelAndView notice(HttpServletRequest request, ModelAndView modelAndView)throws Throwable  {
			//공지사항 0번이니깐 0번으로 보이게
			modelAndView.addObject("gbn", 0);
			modelAndView.setViewName("EMR/notice");
			
			return modelAndView;
		} //공지사항 페이지 연결 끝
		
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//공지사항
		@RequestMapping(value="/refreshTest")
		public @ResponseBody ResponseEntity<String> refreshTest(
				HttpServletRequest request, 
				@RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable{
			
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), 
					iBbsService.getBbsCount(params));
			
			
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
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//사내게시판
		@RequestMapping(value="/refreshTest2")
		public @ResponseBody ResponseEntity<String> refreshTest2(
				HttpServletRequest request, 
				@RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable{
			
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), 
					iBbsService.getBbsCount(params));
			
			
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//메인화면 공지사항
			@RequestMapping(value="/refreshTest3")
			public @ResponseBody ResponseEntity<String> refreshTest3(
			HttpServletRequest request, 
			@RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable{
			
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), 
			iBbsService.main_notice2(params));
			
			
			params.put("start", Integer.toString(pb.getStartCount()));
			params.put("end", Integer.toString(pb.getEndCount()));
			
			ArrayList<HashMap<String, String>> list
			= iBbsService.main_notice1(params);
			
			modelMap.put("list",list);
			modelMap.put("pb",pb);
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type","text/json; charset=UTF-8");
			
			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
			responseHeaders,HttpStatus.CREATED);
			}
			///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//메인화면 사내게시판
			@RequestMapping(value="/refreshTest4")
			public @ResponseBody ResponseEntity<String> refreshTest4(
			HttpServletRequest request, 
			@RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable{
			
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), 
			iBbsService.main_bbs2(params));
			
			
			params.put("start", Integer.toString(pb.getStartCount()));
			params.put("end", Integer.toString(pb.getEndCount()));
			
			ArrayList<HashMap<String, String>> list
			= iBbsService.main_bbs1(params);
			
			modelMap.put("list",list);
			System.out.println("sadsadsadsadsadsadsadasdas"+list);
			modelMap.put("pb",pb);
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type","text/json; charset=UTF-8");
			
			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
			responseHeaders,HttpStatus.CREATED);
			}
			///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//메인화면 휴진현황
			@RequestMapping(value="/refreshTest5")
			public @ResponseBody ResponseEntity<String> refreshTest5(
			HttpServletRequest request, 
			@RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable{
			
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), 
			iBbsService.main_rest2(params));
			
			
			params.put("start", Integer.toString(pb.getStartCount()));
			params.put("end", Integer.toString(pb.getEndCount()));
			
			ArrayList<HashMap<String, String>> list
			= iBbsService.main_rest1(params);
			
			modelMap.put("list",list);
			modelMap.put("pb",pb);
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type","text/json; charset=UTF-8");
			
			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
			responseHeaders,HttpStatus.CREATED);
			}
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//글 등록 컨트롤러
			@RequestMapping(value="/insertTest")
		public @ResponseBody ResponseEntity<String> insertTest(
				HttpServletRequest request, 
				@RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable{
			
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			System.out.println(params);
			
			HashMap<String, String> con = iBbsService.getMaxPOST_Count(params);
			
			params.putAll(con);
			
			String res = iBbsService.insertTest(params);
			
			modelMap.put("res", res);
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type","text/json; charset=UTF-8");
			
			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
					responseHeaders,HttpStatus.CREATED);
			
	}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
		//글 삭제 컨트롤러
			@RequestMapping(value="/deleteTest")
		public @ResponseBody ResponseEntity<String> deleteTest(
				HttpServletRequest request, 
				@RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable{
			
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			int res = iBbsService.deleteTest(params);
			//update가 int를 받을수있는지
			modelMap.put("res", res);
			System.out.println(params);
			System.out.println(res);
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type","text/json; charset=UTF-8");
			
			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
					responseHeaders,HttpStatus.CREATED);
			
	}
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//글 수정 컨트롤러
			@RequestMapping(value="/updateTest")
		public @ResponseBody ResponseEntity<String> updateTest(
				HttpServletRequest request, 
				@RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable{
			
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			int res = iBbsService.updateTest(params);
			//update가 int를 받을수있는지
			modelMap.put("res", res);
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type","text/json; charset=UTF-8");
			
			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
					responseHeaders,HttpStatus.CREATED);
		}
		
	
		
}
