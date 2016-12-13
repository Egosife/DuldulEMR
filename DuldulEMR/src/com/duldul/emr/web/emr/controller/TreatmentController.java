package com.duldul.emr.web.emr.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
			@RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable {
		
		HashMap<String, String> getpatiinfo = iTreatmentService.getpatiinfo(params);
		
		modelAndView.addObject("p",getpatiinfo);

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

	//접수 타입 받아오기
	@RequestMapping(value="/getTreatType")
	public @ResponseBody ResponseEntity<String> getTreatType(HttpServletRequest request,
			ModelAndView modelAndView) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		ArrayList<HashMap<String, String>> treatType = iTreatmentService.getTreatType();
		
		modelMap.put("type", treatType);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}

	//진료과 타입 받아오기
	@RequestMapping(value="/gettreatsort_type")
	public @ResponseBody ResponseEntity<String> gettreatsort_type(HttpServletRequest request,
			ModelAndView modelAndView) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		ArrayList<HashMap<String, String>> treatsort_type = iTreatmentService.gettreatsort_type();
		
		modelMap.put("treatsort", treatsort_type);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}

	//진료진 정보 받아오기
	@RequestMapping(value="/getdoctor")
	public @ResponseBody ResponseEntity<String> getdoctor(HttpServletRequest request,
			 @RequestParam HashMap<String, String> params,
			 ModelAndView modelAndView) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		ArrayList<HashMap<String, String>> getdoctor = iTreatmentService.getdoctor(params);
		
		System.out.println(getdoctor);
		
		modelMap.put("getdoctor", getdoctor);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}

	//진료 기록 정보 받아오기
	@RequestMapping(value="/treat_his")
	public @ResponseBody ResponseEntity<String> treat_his(HttpServletRequest request,
			@RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		ArrayList<HashMap<String, String>> gettreatinfo = iTreatmentService.gettreatinfo(params);
		modelMap.put("gettreatinfo", gettreatinfo);

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}

	//진료 기록 정보 받아오기
	@RequestMapping(value="/pill_his")
	public @ResponseBody ResponseEntity<String> pill_his(HttpServletRequest request,
			@RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		ArrayList<HashMap<String, String>> getpillinfo = iTreatmentService.getpillinfo(params);
		modelMap.put("getpillinfo", getpillinfo);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	//진료 기록 정보 받아오기
	@RequestMapping(value="/care_his")
	public @ResponseBody ResponseEntity<String> care_his(HttpServletRequest request,
			@RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		ArrayList<HashMap<String, String>> getcareinfo = iTreatmentService.getcareinfo(params);
		modelMap.put("getcareinfo", getcareinfo);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}

	//진료 기록
	@RequestMapping(value="/inserttreathis")
	public @ResponseBody ResponseEntity<String> inserttreathis(HttpServletRequest request,
			@RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		String res = iTreatmentService.inserttreathis(params);
		
		if(res == "true"){
			String res2 = iTreatmentService.inserttreatmore(params);
			if(res2 == "true"){
				int res3 = iTreatmentService.updatetreat(params);
				modelMap.put("res", res);
			}
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}

	//진료 기록
		@RequestMapping(value="/insertcares")
		public @ResponseBody ResponseEntity<String> insertcares(HttpServletRequest request,
				@RequestParam(value="patinum", required=false) List<String> patinum,
				@RequestParam(value="treatnum", required=false) List<String> treatnum,
				@RequestParam(value="treatcare", required=false) List<String> treatcare,
				@RequestParam(value="treatpill", required=false) List<String> treatpill,
				ModelAndView modelAndView) throws Throwable{
			
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String,Object>();
			
			System.out.println(patinum.get(0));
			System.out.println(treatnum.get(0));
			System.out.println(treatcare);
			System.out.println(treatpill);
			
			String res = iTreatmentService.inserttreatcare(patinum, treatnum, treatcare);
			String res2 = iTreatmentService.inserttreatpill(patinum, treatnum, treatpill);
			
			if(res == "true" && res2 == "true"){
				modelMap.put("res", "true");
			}else{
				modelMap.put("res", "false");
			}
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
			
			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
					responseHeaders, HttpStatus.CREATED);
		}
	
}