package com.duldul.emr.web.P_Service;

import java.util.ArrayList;
import java.util.HashMap;

public interface Patient_iService { //2016-11-30 이관우 인터페이스 서비스 작성

	public int Patient_Count(HashMap<String, String> pari) throws Throwable;
	//환자조회 인터페이스 서비스
	
	public ArrayList<HashMap<String, String>> patient_DataList(HashMap<String, String> pari) throws Throwable;
	//환자조회 인터페이스 서비스
	
	public int EMP_Count(HashMap<String, String> parang) throws Throwable;
	//직원조회 인터페이스 서비스
	
	public ArrayList<HashMap<String, String>> EMP_DataList(HashMap<String, String> parang) throws Throwable;
	//직원조회 인터페이스 서비스
	
	public HashMap<String, String> getDetails_info(HashMap<String, String> padar_padar) throws Throwable;
	//환자 상세조회 정보 인터페이스 서비스
	
	public ArrayList<HashMap<String, String>> Det_DataList(HashMap<String, String> padar_padar) throws Throwable;
	//진단기록 인터페이스 서비스
	
	public ArrayList<HashMap<String, String>> Det_DataList2(HashMap<String, String> padar_padar_padar) throws Throwable;
	//처방기록 인터페이스 서비스
	
	public HashMap<String, String> insert_SEQ() throws Throwable;
	//SEQ.NEXTVAL 인터페이스 서비스
	
	public String pat_insert(HashMap<String, String> paprika) throws Throwable;
	//환자정보 인터페이스 서비스
	
	public String patmore_insert(HashMap<String, String> paprika) throws Throwable;
	//환자추가정보 인터페이스 서비스
	
	public int Set_Count(HashMap<String, String> parigee) throws Throwable;
	//환자일정 조회 인터페이스 서비스
	
	public ArrayList<HashMap<String, String>> Set_DataList(HashMap<String, String> parigee) throws Throwable;
	//환자일정 조회 인터페이스 서비스

	public ArrayList<HashMap<String, String>> Selectsort_type() throws Throwable;
	//진료과 타입 인터페이스 서비스
	
	public ArrayList<HashMap<String, String>> get_Selectdoc(HashMap<String, String> papamama) throws Throwable;
	//진료의사 타입 인터페이스 서비스
	
	public HashMap<String, String> getService_info(HashMap<String, String> sheep_paring) throws Throwable;
	//회원정보수정 데이터 인터페이스 서비스
	
	public int update_Service(HashMap<String, String> Yora_Fire) throws Throwable;
	//회원정보수정 인터페이스 서비스
	
	public HashMap<String, String> getPassword_info(HashMap<String, String> Mambos) throws Throwable;
	//비밀번호 확인 인터페이스 서비스
	
	public int update_Password(HashMap<String, String> Mambos) throws Throwable;
	//비밀번호 변경 인터페이스 서비스
	
	public ArrayList<HashMap<String, String>> Hos_chart_Data(HashMap<String, String> chacha) throws Throwable;
	//환자방문 차트 인터페이스 서비스
	
	public ArrayList<HashMap<String, String>> Hos_chart_Data2(HashMap<String, String> chichi) throws Throwable;
	//환자구분 차트 인터페이스 서비스
	
	public ArrayList<HashMap<String, String>> Hos_chart_Data3(HashMap<String, String> cheche) throws Throwable;
	//진료과별 남녀비율 차트 인터페이스 서비스
}
