package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface IBbsService {
	
	public ArrayList<HashMap<String, String>> getBbs(HashMap<String, String> params)throws Throwable;

	public int getBbsCount(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getBbsCon(HashMap<String, String> params) throws Throwable;

	public String insertTest(HashMap<String, String> params)throws Throwable;

	public int deleteTest(HashMap<String, String> params)throws Throwable;

	public int updateTest(HashMap<String, String> params)throws Throwable;

	public int visit(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getMaxPOST_Count(HashMap<String, String> params) throws Throwable;

	public int main_notice2(HashMap<String, String> params)throws Throwable;

	public ArrayList<HashMap<String, String>> main_notice1(HashMap<String, String> params)throws Throwable;

	public int main_bbs2(HashMap<String, String> params)throws Throwable;

	public ArrayList<HashMap<String, String>> main_bbs1(HashMap<String, String> params)throws Throwable;

	public int main_rest2(HashMap<String, String> params)throws Throwable;

	public ArrayList<HashMap<String, String>> main_rest1(HashMap<String, String> params)throws Throwable;


	
}
