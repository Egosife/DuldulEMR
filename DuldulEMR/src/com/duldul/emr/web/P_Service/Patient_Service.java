package com.duldul.emr.web.P_Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duldul.emr.web.P_Dao.Patient_iDao;

@Service
public class Patient_Service implements Patient_iService { //2016-11-30 이관우 서비스클래스 작성
	
	@Autowired
	public Patient_iDao Patient_Dao;
	
	@Override
	public int Patient_Count(HashMap<String, String> pari) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.Patient_Count(pari);
	} //환자조회 서비스클래스

	@Override
	public ArrayList<HashMap<String, String>> patient_DataList(HashMap<String, String> pari) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.patient_DataList(pari);
	} //환자조회 서비스클래스
	
	@Override
	public int EMP_Count(HashMap<String, String> parang) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.EMP_Count(parang);
	} //직원조회 서비스클래스

	@Override
	public ArrayList<HashMap<String, String>> EMP_DataList(HashMap<String, String> parang) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.EMP_DataList(parang);
	} //직원조회 서비스클래스
}