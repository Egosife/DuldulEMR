package com.duldul.emr.web.emr.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface IDailyDao {
	
	HashMap<String, String> getemp_List(HashMap<String, String> params)throws Throwable;
	
	ArrayList<HashMap<String, String>> getDaily(HashMap<String, String> params)throws Throwable;
	
	int getDailyCount(HashMap<String, String> params) throws Throwable;
	
	HashMap<String, String> getDailyCon(HashMap<String, String> params)throws Throwable;
	
	int dailyUpdate(HashMap<String, String> params) throws Throwable;
	
	int dailyDelete(HashMap<String, String> params) throws Throwable;
	
	String dailyInsert(HashMap<String, String> params) throws Throwable;
}
