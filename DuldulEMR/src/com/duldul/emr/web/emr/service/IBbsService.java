package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface IBbsService {
	
	public ArrayList<HashMap<String, String>> getBbs(HashMap<String, String> params)throws Throwable;

	public int getBbsCount(HashMap<String, String> params) throws Throwable;

	
}
