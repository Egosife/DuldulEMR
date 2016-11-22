package com.duldul.emr.web.chart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.duldul.emr.web.chart.bean.ChartBean;

@Controller
public class ChartController {
	@RequestMapping(value = "/chart")
	public ModelAndView chart(HttpServletRequest request,
			ModelAndView modelAndView) {
		
		modelAndView.setViewName("chart/chart");
		
		return modelAndView;
	}
	

	@RequestMapping(value = "/getChartData")
	public @ResponseBody ResponseEntity<String> getChartData(
			HttpServletRequest request, ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int size = Integer.parseInt(request.getParameter("size"));
		
		int series = Integer.parseInt(request.getParameter("series"));
		
		ArrayList<ChartBean> list = new ArrayList<ChartBean>();
		
		for(int s = 0 ; s < series ; s++) {
			ChartBean cb = new ChartBean(size);
			
			cb.setName("S" + s);
			cb.setPointInterval(1);
			cb.setPointStart(1999);
			
			for(int i = 0 ; i < size ; i++) {
				cb.getData()[i] = (int) (Math.random() * 100); 
			}
			
			list.add(cb);
		}
		
		modelMap.put("data", list);
		
		HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
        
        return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
}
