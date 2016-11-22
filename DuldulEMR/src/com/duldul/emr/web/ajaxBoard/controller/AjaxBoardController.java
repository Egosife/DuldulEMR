package com.duldul.emr.web.ajaxBoard.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.duldul.emr.common.CommonProperties;
import com.duldul.emr.common.bean.PagingBean;
import com.duldul.emr.common.service.IPagingService;
import com.duldul.emr.web.ajaxBoard.bean.AjaxBoardBean;
import com.duldul.emr.web.ajaxBoard.service.IAjaxBoardService;

@Controller
public class AjaxBoardController {
	@Autowired
	public IAjaxBoardService iAjaxBoardService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/ajaxBoard")
	public ModelAndView ajaxBoard(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("ajaxBoard/ajaxBoard");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/ajaxBoardInsertResult")
	public @ResponseBody ResponseEntity<String> ajaxBoardInsertResult(
			@ModelAttribute(value="AjaxBoardBean") AjaxBoardBean abb,
			HttpServletRequest request,
			ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iAjaxBoardService.insertBoard(abb);
			
			modelMap.put("message", CommonProperties.RESULT_SUCCESS);
		} catch(Exception e) {
			modelMap.put("message", CommonProperties.RESULT_ERROR);
			modelMap.put("errorMessage", e.getMessage());
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
        
        return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/ajaxBoardReadList")
	public @ResponseBody ResponseEntity<String> ajaxBoardReadList(
			HttpServletRequest request,
			ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchGbn", request.getParameter("searchGbn"));
		params.put("searchText", request.getParameter("searchText"));
		
		int page = Integer.parseInt(request.getParameter("page"));
		
		params.put("page", page);
		
		try {
			int count = iAjaxBoardService.getBoardCount(params);
			
			PagingBean pb = iPagingService.getPageingBean(page, count);
			params.put("startCount", pb.getStartCount());
			params.put("endCount", pb.getEndCount());
			
			ArrayList<AjaxBoardBean> list = iAjaxBoardService.getBoardList(params);
			
			modelMap.put("pb", pb);
			modelMap.put("list", list);
			
			modelMap.put("message", CommonProperties.RESULT_SUCCESS);
		} catch(Exception e) {
			modelMap.put("message", CommonProperties.RESULT_ERROR);
			modelMap.put("errorMessage", e.getMessage());
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/ajaxBoardReadDetail")
	public @ResponseBody ResponseEntity<String> ajaxBoardReadDetail(
			HttpServletRequest request,
			ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			String boardNo = request.getParameter("boardNo");
			
			iAjaxBoardService.updateHitCnt(boardNo);
			
			AjaxBoardBean abb = iAjaxBoardService.getBoardDetail(boardNo);
			
			modelMap.put("abb", abb);
			
			modelMap.put("message", CommonProperties.RESULT_SUCCESS);
		} catch(Exception e) {
			modelMap.put("message", CommonProperties.RESULT_ERROR);
			modelMap.put("errorMessage", e.getMessage());
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/ajaxBoardPassCheckResult")
	public @ResponseBody ResponseEntity<String> ajaxBoardPassCheckResult(
			@ModelAttribute(value="AjaxBoardBean") AjaxBoardBean abb,
			HttpServletRequest request,
			ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			String result = iAjaxBoardService.checkPass(abb);
			
			modelMap.put("result", result);
			
			modelMap.put("message", CommonProperties.RESULT_SUCCESS);
		} catch(Exception e) {
			modelMap.put("message", CommonProperties.RESULT_ERROR);
			modelMap.put("errorMessage", e.getMessage());
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/ajaxBoardUpdateResult")
	public @ResponseBody ResponseEntity<String> ajaxBoardUpdateResult(
			@ModelAttribute(value="AjaxBoardBean") AjaxBoardBean abb,
			HttpServletRequest request,
			ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iAjaxBoardService.updateBoard(abb);
			
			modelMap.put("message", CommonProperties.RESULT_SUCCESS);
		} catch(Exception e) {
			modelMap.put("message", CommonProperties.RESULT_ERROR);
			modelMap.put("errorMessage", e.getMessage());
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/ajaxBoardDeleteResult")
	public @ResponseBody ResponseEntity<String> ajaxBoardDeleteResult(
			@ModelAttribute(value="AjaxBoardBean") AjaxBoardBean abb,
			HttpServletRequest request,
			ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iAjaxBoardService.deleteBoard(abb);
			
			modelMap.put("message", CommonProperties.RESULT_SUCCESS);
		} catch(Exception e) {
			modelMap.put("message", CommonProperties.RESULT_ERROR);
			modelMap.put("errorMessage", e.getMessage());
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
}
