package com.duldul.emr.web.P_Dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface Patient_iDao { //2016-11-30 이관우 인터페이스 디에이오 작성
	
	public int Patient_Count(HashMap<String, String> pari) throws Throwable;
	//환자조회 인터페이스 디에이오
	
	public ArrayList<HashMap<String, String>> patient_DataList(HashMap<String, String> pari) throws Throwable;
	//환자조회 인터페이스 디에이오

	public int EMP_Count(HashMap<String, String> parang) throws Throwable;
	//직원조회 인터페이스 디에이오

	public ArrayList<HashMap<String, String>> EMP_DataList(HashMap<String, String> parang) throws Throwable;
	//직원조회 인터페이스 디에이오

	public HashMap<String, String> getDetails_info(HashMap<String, String> padar_padar) throws Throwable;
	//환자 상세조회 인터페이스 디에이오

	public ArrayList<HashMap<String, String>> Det_DataList(HashMap<String, String> padar_padar) throws Throwable;
	//진단기록 인터페이스 디에이오
	
	public ArrayList<HashMap<String, String>> Det_DataList2(HashMap<String, String> padar_padar_padar) throws Throwable;
	//처방기록 인터페이스 디에이오
	
	public HashMap<String, String> insert_SEQ() throws Throwable;
	//SEQ.NEXTVAL 인터페이스 디에이오
	
	public String pat_insert(HashMap<String, String> paprika) throws Throwable;
	//환자정보 인터페이스 디에이오

	public String patmore_insert(HashMap<String, String> paprika) throws Throwable;
	//환자추가정보 인터페이스 디에이오
	
	public int Set_Count(HashMap<String, String> parigee) throws Throwable;
	//환자일정 조회 인터페이스 디에이오
	
	public ArrayList<HashMap<String, String>> Set_DataList(HashMap<String, String> parigee) throws Throwable;
	//환자일정 조회 인터페이스 디에이오

	public ArrayList<HashMap<String, String>> Selectsort_type() throws Throwable;
	//진료과 타입 받아오기
	
	public ArrayList<HashMap<String, String>> get_Selectdoc(HashMap<String, String> papamama) throws Throwable;
	//진료의사 타입 받아오기

}
