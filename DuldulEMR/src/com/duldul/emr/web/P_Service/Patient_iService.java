package com.duldul.emr.web.P_Service;

import java.util.ArrayList;
import java.util.HashMap;

public interface Patient_iService { //2016-11-30 이관우 인터페이스 서비스 작성

	int Patient_Count(HashMap<String, String> pari) throws Throwable; //환자조회 인터페이스 서비스
	
	public ArrayList<HashMap<String, String>> patient_DataList(HashMap<String, String> pari) throws Throwable; //환자조회 인터페이스 서비스
	
	int EMP_Count(HashMap<String, String> parang) throws Throwable; //직원조회 인터페이스 서비스
	
	public ArrayList<HashMap<String, String>> EMP_DataList(HashMap<String, String> parang) throws Throwable; //직원조회 인터페이스 서비스


}
