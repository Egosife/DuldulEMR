package com.duldul.emr.web.P_Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class Patient_Dao implements Patient_iDao { //2016-11-30 이관우 디에이오클래스 작성
	
	@Autowired
	public SqlMapClient sqlMapC_t;
	
	@Override
	public int Patient_Count(HashMap<String, String> pari) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapC_t.queryForObject("Patient_Data.Pat_Count", pari); //sql id 지정
	} //환자조회 디에이오 클래스
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> patient_DataList(HashMap<String, String> pari) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapC_t.queryForList("Patient_Data.pat_DataList", pari); //sql id 지정
	} //환자조회 디에이오 클래스
	
	@Override
	public int EMP_Count(HashMap<String, String> parang) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapC_t.queryForObject("Patient_Data.Emp_Count", parang); //sql id 지정
	} //직원조회 디에이오 클래스
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> EMP_DataList(HashMap<String, String> parang) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapC_t.queryForList("Patient_Data.Emp_DataList", parang); //sql id 지정
	} //직원조회 디에이오 클래스

}
