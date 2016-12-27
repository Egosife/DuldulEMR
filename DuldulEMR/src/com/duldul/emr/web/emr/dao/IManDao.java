package com.duldul.emr.web.emr.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface IManDao {

	ArrayList<HashMap<String, String>> ManEmpList(HashMap<String, String> params)throws Throwable; 
	
	int getManCount(HashMap<String, String> params) throws Throwable;
}
