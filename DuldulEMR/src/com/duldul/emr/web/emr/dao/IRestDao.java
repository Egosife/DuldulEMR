package com.duldul.emr.web.emr.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface IRestDao {
	ArrayList<HashMap<String, String>> getRest(HashMap<String, String> params)throws Throwable;
	
	int getRestCount(HashMap<String, String> params) throws Throwable;
	
	ArrayList<HashMap<String, String>> getRestList(HashMap<String, String> params)throws Throwable;
}
