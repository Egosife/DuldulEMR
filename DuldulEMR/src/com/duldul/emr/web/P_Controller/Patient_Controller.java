package com.duldul.emr.web.P_Controller;

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
import com.duldul.emr.web.Hospital_Chart_Bean.Hospital_Bean;
import com.duldul.emr.web.Hospital_Chart_Bean.Hospital_Bean2;
import com.duldul.emr.web.P_Service.Patient_iService;

@Controller
public class Patient_Controller { //2016-11-30 이관우 컨트롤러 작성
	
	@Autowired
	public Patient_iService Patient_iService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/Patient_page") //환자조회
	public ModelAndView EMR_Pat_page(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("EMR/Patient_page");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/Pat_list") //환자리스트 Patient_page(ajax)
	public @ResponseBody ResponseEntity<String> Pat_list(HttpServletRequest request,
			@RequestParam HashMap<String, String> pari,
			ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(pari.get("Pat_page")),
				Patient_iService.Patient_Count(pari));
		
		pari.put("start", Integer.toString(pb.getStartCount()));
		pari.put("end", Integer.toString(pb.getEndCount()));
		
		ArrayList<HashMap<String, String>> list = Patient_iService.patient_DataList(pari);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/Sign_up") //환자등록
	public ModelAndView EMR_Sign_up(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("EMR/Patient_sign_up");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/patient_insert") //환자등록 데이터
	public @ResponseBody ResponseEntity<String> patient_insert(HttpServletRequest request,
			@RequestParam HashMap<String, String> paprika,
			ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		HashMap<String, String> insert_SEQ = Patient_iService.insert_SEQ(); //SEQ.NEXTVAL
		
		if(!insert_SEQ.isEmpty()){
			paprika.putAll(insert_SEQ);
			System.out.println(insert_SEQ);
			String P_insert = Patient_iService.pat_insert(paprika); //환자정보
			System.out.println(paprika);
			if(P_insert == "true"){
				String pm_insert = Patient_iService.patmore_insert(paprika); //환자추가정보
				modelMap.put("pm_insert", pm_insert);
			}
		} else {
			modelMap.put("pm_insert", "fail");
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/Details") //환자 상세조회
	public ModelAndView EMR_details(HttpServletRequest request,
			@RequestParam HashMap<String, String> paring,
			ModelAndView modelAndView) {
		
		modelAndView.addObject("papajohns",paring);
		modelAndView.setViewName("EMR/Patient_details");
		
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/Details_data") //환자 상세조회 정보(ajax)
	public @ResponseBody ResponseEntity<String> Details_data(HttpServletRequest request,
			@RequestParam HashMap<String, String> padar_padar,
			HttpSession session, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		System.out.println(padar_padar);
		
		HashMap<String, String> Det_info = Patient_iService.getDetails_info(padar_padar); //환자 상세정보
		ArrayList<HashMap<String, String>> list = Patient_iService.Det_DataList(padar_padar); //진단기록
		
		modelMap.put("Det_info", Det_info); //환자 상세정보
		modelMap.put("list", list); //진단기록
		
		//System.out.println(Det_info);
		System.out.println("ASDADASDASD"+list);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/Details_data2") //환자 상세조회 정보(ajax)
	public @ResponseBody ResponseEntity<String> Details_data2(HttpServletRequest request,
			@RequestParam HashMap<String, String> padar_padar_padar,
			HttpSession session, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		ArrayList<HashMap<String, String>> list2 = Patient_iService.Det_DataList2(padar_padar_padar); //처방기록
		
		modelMap.put("list2", list2); //처방기록
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/Emp_page") //직원조회
	public ModelAndView EMR_Emp(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("EMR/Emp_page");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/EMP_list") //직원리스트 Emp_page(ajax)
	public @ResponseBody ResponseEntity<String> EMP_list(HttpServletRequest request,
			@RequestParam HashMap<String, String> parang,
			ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(parang.get("Emp_page")),
				Patient_iService.EMP_Count(parang));
		
		parang.put("start", Integer.toString(pb.getStartCount()));
		parang.put("end", Integer.toString(pb.getEndCount()));
		
		ArrayList<HashMap<String, String>> list = Patient_iService.EMP_DataList(parang);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/set") //환자 일정조회
	public ModelAndView EMR_set(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("EMR/Patient_set");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/Set_list_page") //환자일정 조회 리스트 (ajax)
	public @ResponseBody ResponseEntity<String> Set_list_page(HttpServletRequest request,
			@RequestParam HashMap<String, String> parigee,
			ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(parigee.get("Set_page")),
				Patient_iService.Set_Count(parigee));
		
		parigee.put("start", Integer.toString(pb.getStartCount()));
		parigee.put("end", Integer.toString(pb.getEndCount()));
		
		ArrayList<HashMap<String, String>> list = Patient_iService.Set_DataList(parigee);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/get_Selectsort") //진료과 타입 받아오기
	public @ResponseBody ResponseEntity<String> Selectsort_type(HttpServletRequest request,
			ModelAndView modelAndView) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		ArrayList<HashMap<String, String>> Stbox = Patient_iService.Selectsort_type();
		
		modelMap.put("Stbox", Stbox);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/get_Selectdoc") //진료의사 타입 받아오기
	public @ResponseBody ResponseEntity<String> get_Selectdoc(HttpServletRequest request,
			 @RequestParam HashMap<String, String> papamama,
			 ModelAndView modelAndView) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		ArrayList<HashMap<String, String>> good_doctor = Patient_iService.get_Selectdoc(papamama);
		
		System.out.println(good_doctor);
		
		modelMap.put("good_doctor", good_doctor);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/Service_page") //회원정보수정
	public ModelAndView EMR_Service_page(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("EMR/Emp_service");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/Service_data") //회원정보수정 데이터(ajax)
	public @ResponseBody ResponseEntity<String> Service_data(HttpServletRequest request,
			@RequestParam HashMap<String, String> sheep_paring,
			HttpSession session, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		System.out.println(sheep_paring);
		
		HashMap<String, String> Es_info = Patient_iService.getService_info(sheep_paring); //회원정보수정
		
		modelMap.put("Es_info", Es_info); //환자 상세정보
		
		System.out.println("ASDADASDASD" + Es_info);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/update_Service") //회원정보수정
	public @ResponseBody ResponseEntity<String> update_Service(HttpServletRequest request,
			@RequestParam HashMap<String, String> Yora_Fire,
			ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int res = Patient_iService.update_Service(Yora_Fire);
		//update가 int를 받을수있는지
		modelMap.put("res", res);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders,HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/Emp_Password_Service") //비밀번호 변경
	public @ResponseBody ResponseEntity<String> Emp_Password_Service(HttpServletRequest request,
			@RequestParam HashMap<String, String> Mambos,
			ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		if(Mambos.get("Emp_New_Password").equals(Mambos.get("Emp_New_Password_check"))){
			HashMap<String, String> Es_password = Patient_iService.getPassword_info(Mambos); //현재 비밀번호를 불러옴
			
			//System.out.println(Es_password.get("PW"));
			System.out.println("ads"+Mambos);
			if(Mambos.get("Emp_Password").equals(Es_password.get("PW"))){
				int res = Patient_iService.update_Password(Mambos); //비밀번호 업데이트
				modelMap.put("res", res);
				System.out.println(res);
			}else{
				modelMap.put("res", "3");
			}
		}else{
			modelMap.put("res", "2");
		}
		
		//int res = Patient_iService.update_Service(Mambos);
		//update가 int를 받을수있는지
		//modelMap.put("res", res);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders,HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/Hospital_chart") //병원현황
	public ModelAndView Hospital_chart(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("EMR/Hospital_chart");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/Hospital_chart_Data") //환자방문 차트
	public @ResponseBody ResponseEntity<String> Hospital_chart_Data(HttpServletRequest request,
			@RequestParam HashMap<String, String> chacha,
			HttpSession session, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		chacha.put("Hospital_Code", session.getAttribute("sHospital_Code").toString());
		ArrayList<HashMap<String, String>> list = Patient_iService.Hos_chart_Data(chacha); //병원데이터
		
		ArrayList<Hospital_Bean> data = new ArrayList<Hospital_Bean>(); //Bean데이터
		
		for(int i = 0; i < 2; i++) {
			Hospital_Bean hb = new Hospital_Bean(12);
			
			hb.setName(list.get(i * 12).get("NAME"));
			
			for(int k = 0; k < 12; k++) {
				hb.getData()[k] = Integer.parseInt(String.valueOf(list.get((i * 12) + k).get("DATA")));				
			}
			
			data.add(hb);
		}
		
		modelMap.put("data", data);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/Hospital_chart_Data2") //환자구분 차트
	public @ResponseBody ResponseEntity<String> Hospital_chart_Data2(HttpServletRequest request,
			@RequestParam HashMap<String, String> chichi,
			HttpSession session, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		chichi.put("Hospital_Code", session.getAttribute("sHospital_Code").toString());
		ArrayList<HashMap<String, String>> list = Patient_iService.Hos_chart_Data2(chichi); //병원데이터
		
		ArrayList<Hospital_Bean2> data = new ArrayList<Hospital_Bean2>(); //Bean데이터
		
		for(int i = 0; i < list.size(); i++) {
			Hospital_Bean2 hb = new Hospital_Bean2();
			
			hb.setName(list.get(i).get("NAME"));
			
			hb.setY(Integer.parseInt(String.valueOf(list.get(i).get("DATA"))));				
			
			data.add(hb);
		}
		
		modelMap.put("data", data);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/Hospital_chart_Data3") //진료과별 남녀비율 차트
	public @ResponseBody ResponseEntity<String> Hospital_chart_Data3(HttpServletRequest request,
			@RequestParam HashMap<String, String> cheche,
			HttpSession session, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		cheche.put("Hospital_Code", session.getAttribute("sHospital_Code").toString());
		ArrayList<HashMap<String, String>> list = Patient_iService.Hos_chart_Data3(cheche); //병원데이터
		
		ArrayList<Hospital_Bean> data = new ArrayList<Hospital_Bean>(); //Bean데이터
		ArrayList<String> category = new ArrayList<String>();
		
		for(int i = 0; i < 2; i++) {
			Hospital_Bean hb = new Hospital_Bean(list.size()/2);
			
			hb.setName(list.get(i * list.size()/2).get("NAME"));
			
			for(int k = 0; k < list.size()/2; k++) {
				if(i == 0) {
					category.add(list.get((i * list.size()/2) + k).get("CATEGORY"));
				}
				hb.getData()[k] = Integer.parseInt(String.valueOf(list.get((i * list.size()/2) + k).get("DATA")));				
			}		
			
			data.add(hb);
		}
		
		modelMap.put("data", data);
		modelMap.put("category", category);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				responseHeaders, HttpStatus.CREATED);
	}

}
