package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

@Service
public interface IDailyService {
	
	//직원 데이터 가져오기
	public HashMap<String, String> getemp_List(HashMap<String, String> params) throws Throwable;
	
	//일일 업무 일지 가져오기
	public ArrayList<HashMap<String, String>> getDaily(HashMap<String, String> params) throws Throwable;
	
	public int getDailyCount(HashMap<String, String> params) throws Throwable;
	
	public HashMap<String, String> getDailyCon(HashMap<String, String> params) throws Throwable;
	
	//insert
	public String dailyInsert(HashMap<String, String> params) throws Throwable;
	
	//delete
	public int dailyDelete(HashMap<String, String> params) throws Throwable;
	
	//update
	public int dailyUpdate(HashMap<String, String> params) throws Throwable;
}