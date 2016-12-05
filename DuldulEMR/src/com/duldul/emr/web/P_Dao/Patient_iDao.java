package com.duldul.emr.web.P_Dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface Patient_iDao { //2016-11-30 이관우 인터페이스 디에이오 작성
	
	public int Patient_Count(HashMap<String, String> pari) throws Throwable; //환자조회 인터페이스 디에이오
	
	public ArrayList<HashMap<String, String>> patient_DataList(HashMap<String, String> pari) throws Throwable; //환자조회 인터페이스 디에이오

	public int EMP_Count(HashMap<String, String> parang) throws Throwable; //직원조회 인터페이스 디에이오

	public ArrayList<HashMap<String, String>> EMP_DataList(HashMap<String, String> parang) throws Throwable; //직원조회 인터페이스 디에이오

}
