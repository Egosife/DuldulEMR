package com.duldul.emr.web.emr.controller;

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

import com.duldul.emr.web.emr.service.ILogonService;

@Controller
public class LogonController {
	
	@Autowired
	public ILogonService iLogonService;
	
	//Logon 페이지 연결
	@RequestMapping(value="/Logon")
	public ModelAndView Logon(HttpServletRequest request, HttpSession session, ModelAndView modelAndView) {
		
		if(session.getAttribute("sEmp_Num") != null){
			modelAndView.setViewName("redirect:emrmain");
		}else{
			modelAndView.setViewName("EMR/Logon");
		}
		
		
		return modelAndView;
	} //Logon 페이지 연결 끝
	
	//계정확인
	@RequestMapping(value="/LoginCheckAjax")
	public @ResponseBody ResponseEntity<String> LoginCheckAjax(HttpServletRequest request,
															   @RequestParam HashMap<String, String> params,
															   HttpSession session,
															   ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		//회원정보 받아옴
		HashMap<String, String> acc = iLogonService.getAcc(params);
		//회원정보가 들어왔다면
		if(acc != null && !acc.isEmpty()){
			session.setAttribute("sHospital_Code", acc.get("HOSPITAL_CODE"));
			session.setAttribute("sHospital_Name", acc.get("HOSPITAL_NAME"));
			session.setAttribute("sEmp_Num", acc.get("EMP_NUM"));
			session.setAttribute("sEmp_Name", acc.get("EMP_NAME"));
			session.setAttribute("sLv_Code", acc.get("LV_CODE"));
			//세션에 데이터를 집어넣음.

			modelMap.put("res", "success");
		}else{
			modelMap.put("res", "fail");
		}
		
		//병원 코드 저장 체크 확인
		if(!params.get("re_hos").isEmpty()){
			modelMap.put("hos_code", params.get("hos_Code"));
			modelMap.put("re_hos_chk",true);
		}else{
			modelMap.put("hos_code", "none");
			modelMap.put("re_hos_chk",false);
		}
		//아이디 코드 저장 체크 확인
		if(!params.get("re_id").isEmpty()){
			modelMap.put("id_code", params.get("emp_id"));
			modelMap.put("re_id_chk",true);
		}else{
			modelMap.put("id_code", "none");
			modelMap.put("re_id_chk",false);
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}


	
}
