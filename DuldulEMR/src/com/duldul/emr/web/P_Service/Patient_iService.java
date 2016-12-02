package com.duldul.emr.web.P_Service;

import java.util.ArrayList;
import java.util.HashMap;

public interface Patient_iService { //2016-11-30 이관우 인터페이스 서비스 작성

	int Patient_Count(HashMap<String, String> pari) throws Throwable;
	
	public ArrayList<HashMap<String, String>> patient_DataList(HashMap<String, String> pari) throws Throwable; //throws Throwable - 예외처리

}
