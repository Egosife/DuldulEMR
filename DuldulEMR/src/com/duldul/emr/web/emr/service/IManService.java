package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;


public interface IManService {

	public ArrayList<HashMap<String, String>> ManEmpList(HashMap<String, String> params) throws Throwable;
	
	public int getManCount(HashMap<String, String> params) throws Throwable;
}
