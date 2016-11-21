package com.spring.sample.web.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.spring.sample.common.CommonProperties;
import com.spring.sample.web.login.bean.LoginBean;
import com.spring.sample.web.login.service.ILoginService;

@Controller
public class LoginController {
	
	@Autowired
	public ILoginService iLoginService;

	@RequestMapping(value = "/login")
	public ModelAndView login(
			HttpServletRequest request, HttpServletResponse response,
			ModelAndView modelAndView) throws Throwable {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("sUserId") != null) {
			modelAndView.setViewName("redirect:hello");
		} else {
			modelAndView.addObject("msg", request.getParameter("msg"));
			
			modelAndView.setViewName("login/login");
		}
		

		return modelAndView;
	}
	
	@RequestMapping(value = "/loginResult")
	public @ResponseBody ResponseEntity<String> loginResult(
			@ModelAttribute(value="LoginBean") LoginBean lb,
			HttpServletRequest request, HttpServletResponse response,
			ModelAndView modelAndView, HttpSession session) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			LoginBean userInfo = iLoginService.getUserInfo(lb);
			
			if(lb != null) {
				//session 값 할당
				session.setAttribute("sUserNo", userInfo.getUserNo());
				session.setAttribute("sUserId", userInfo.getUserId());
				session.setAttribute("sUserNm", userInfo.getUserNm());
				
				modelMap.put("res", "TRUE");
			} else {
				modelMap.put("res", "FALSE");
			}
			
			modelMap.put("message", CommonProperties.RESULT_SUCCESS);
		} catch(Exception e) {
			modelMap.put("message", CommonProperties.RESULT_ERROR);
			modelMap.put("errorMessage", e.getMessage());
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
        
        return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/main")
	public ModelAndView main(
			HttpServletRequest request, HttpServletResponse response,
			ModelAndView modelAndView) throws Throwable {
		
		modelAndView.setViewName("main");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(
			HttpServletRequest request, HttpServletResponse response,
			ModelAndView modelAndView) throws Throwable {
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		String msg = "로그아웃 되었습니다.";
		
		modelAndView.addObject("msg", msg);
		modelAndView.setViewName("redirect:login");

		return modelAndView;
	}
}






