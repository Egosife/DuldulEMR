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
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> patient_DataList(HashMap<String, String> pari) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapC_t.queryForList("Patient_Data.pat_DataList", pari); //sql id 지정
	} //queryForList(); - 여러줄 쿼리 리스트를 받겠다(결과 여러개)

}
