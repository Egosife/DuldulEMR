package com.duldul.emr.web.emr.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface IManDao {

	ArrayList<HashMap<String, String>> ManEmpList(HashMap<String, String> params) throws Throwable; 
	
	int getManCount(HashMap<String, String> params) throws Throwable;
	
	int Man_sayoung(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> actcheck(HashMap<String, String> params) throws Throwable;

	int Man_Reset(HashMap<String, String> params)  throws Throwable;

	ArrayList<HashMap<String, String>> Manjinryolist(HashMap<String, String> params) throws Throwable;

	int Manopt_sujeong(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> Manjinryolist2(HashMap<String, String> params) throws Throwable;

	int Manager_popup_check(HashMap<String, String> params) throws Throwable;

	String man_admin_opt(HashMap<String, String> params) throws Throwable;
}
