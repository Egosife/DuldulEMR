package com.spring.sample.web.chat.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.sample.common.CommonProperties;
import com.spring.sample.web.chat.bean.ChatBean;
import com.spring.sample.web.chat.service.IChatService;

@Controller
public class ChatController {
	@Autowired
	public IChatService iChatService;

	@RequestMapping(value = "chatLogin")
	public ModelAndView chatLogin(HttpServletRequest request,
			HttpSession session, ModelAndView modelAndView) {
		if(session.getAttribute("userNick") != null) {
			modelAndView.setViewName("redirect:chat");
		} else {
			modelAndView.setViewName("chat/chatLogin");
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "joinChat")
	public ModelAndView joinChat(HttpServletRequest request,
			HttpSession session, ModelAndView modelAndView) {
		session.setAttribute("userNick", request.getParameter("userNick"));
		
		modelAndView.setViewName("redirect:chat");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "outChat")
	public ModelAndView outChat(HttpServletRequest request,
			HttpSession session, ModelAndView modelAndView) {
		session.invalidate();
		
		modelAndView.setViewName("redirect:chatLogin");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "chat")
	public ModelAndView chat(HttpServletRequest request,
			HttpSession session, ModelAndView modelAndView) throws Throwable {
		if(session.getAttribute("userNick") == null) {
			modelAndView.setViewName("redirect:chatLogin");
		} else {
			int maxNo = iChatService.getMaxNo();
			
			modelAndView.addObject("maxNo", maxNo);
			
			modelAndView.setViewName("chat/chat");
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/insertChat")
	public @ResponseBody ResponseEntity<String> insertChat(
			@ModelAttribute(value="ChatBean") ChatBean chatBean,
			HttpServletRequest request, ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iChatService.insertChat(chatBean);
			
			modelMap.put("message", CommonProperties.RESULT_SUCCESS);
		} catch(Exception e) {
			modelMap.put("message", CommonProperties.RESULT_ERROR);
			modelMap.put("errorMessage", e.getMessage());
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
        
        return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/getChatList")
	public @ResponseBody ResponseEntity<String> getChatList(
			HttpServletRequest request, ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		int lastChatNo = Integer.parseInt(request.getParameter("lastChatNo"));
		try {
			ArrayList<ChatBean> list = iChatService.getChatList(lastChatNo);
			
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
}
