package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;


public interface IManService {

	public ArrayList<HashMap<String, String>> ManEmpList(HashMap<String, String> params) throws Throwable;
	
	public int getManCount(HashMap<String, String> params) throws Throwable;
	
	public int Man_sayoung(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> actcheck(HashMap<String, String> params) throws Throwable;

	public int Man_Reset(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> Manjinryolist(HashMap<String, String> params) throws Throwable;

	public int Manopt_sujeong(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> Manjinryolist2(HashMap<String, String> params) throws Throwable;

	int Manager_popup_check(HashMap<String, String> params) throws Throwable;

	public String man_admin_opt(HashMap<String, String> params) throws Throwable;
}
