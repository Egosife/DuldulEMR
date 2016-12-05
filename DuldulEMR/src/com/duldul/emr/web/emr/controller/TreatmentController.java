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

import com.duldul.emr.web.emr.service.ITreatmentService;

@Controller
public class TreatmentController {

	@Autowired
	public ITreatmentService iTreatmentService;
	
	//치료실시입력 연결 start
	@RequestMapping(value="/treatment")
	public ModelAndView treatment(HttpServletRequest request,
			ModelAndView modelAndView) {
		
		modelAndView.setViewName("EMR/treatmentinput");
		
		return modelAndView;
	}
	//치료실시입력 연결 end

	//환자접수 연결 start
	@RequestMapping(value="/reception")
	public ModelAndView reception(HttpServletRequest request,
			ModelAndView modelAndView) {
		
		modelAndView.setViewName("EMR/reception");
		
		return modelAndView;
	}
	//환자접수 연결 end

	//환자 검색
	@RequestMapping(value="/treat_patientserach")
	public @ResponseBody ResponseEntity<String> treat_patientserach(HttpServletRequest request,
																	@RequestParam HashMap<String, String> params,
																	HttpSession session,
																	ModelAndView modelAndView) throws Throwable{

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		ArrayList<HashMap<String, String>> serach = iTreatmentService.getPatient(params);
		
		modelMap.put("serach", serach);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}

	//환자 선택
	@RequestMapping(value="/treat_patientselect")
	public @ResponseBody ResponseEntity<String> treat_patientselect(HttpServletRequest request,
																	@RequestParam HashMap<String, String> params,
																	HttpSession session,
																	ModelAndView modelAndView) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		HashMap<String, String> pati_info = iTreatmentService.getPatient_info(params);
		modelMap.put("pati_info", pati_info);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	
	//환자 접수
	@RequestMapping(value="/Treatment_commit")
	public @ResponseBody ResponseEntity<String> Treatment_commit(HttpServletRequest request,
																 @RequestParam HashMap<String, String> params,
																 HttpSession session,
															 	 ModelAndView modelAndView) throws Throwable{

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		HashMap<String, String> treatSEQ = iTreatmentService.getTreatSEQ();
		
		System.out.println(treatSEQ);

		if(!treatSEQ.isEmpty()){
			params.putAll(treatSEQ);
			
			String commit_treat = iTreatmentService.treat_commit(params);
		
			if(commit_treat == "true"){
				String res = iTreatmentService.treat_commit_time(params);
				modelMap.put("res", res);
			}
		}else{
			modelMap.put("res", "fail");
		}

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
}
