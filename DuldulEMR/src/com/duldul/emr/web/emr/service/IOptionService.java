package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface IOptionService {

	ArrayList<HashMap<String, String>> getHosinfo(HashMap<String, String> params)throws Throwable;

	ArrayList<HashMap<String, String>> getempinfo(HashMap<String, String> params)throws Throwable;

	HashMap<String, String> getuphosinfo(HashMap<String, String> params)throws Throwable;

	int getupdhos(HashMap<String, String> params)throws Throwable;

	String admincrehosin(HashMap<String, String> params)throws Throwable;

	HashMap<String, String> getHospitalSEQ()throws Throwable;

	ArrayList<HashMap<String, String>> getposition_select()throws Throwable;

	ArrayList<HashMap<String, String>> getoffice_select()throws Throwable;

	ArrayList<HashMap<String, String>> getlevel_select()throws Throwable;

	String admin_acc_register(HashMap<String, String> params)throws Throwable;

	int admin_regi_id_chk(HashMap<String, String> params)throws Throwable;

	String admincrehosinopt(HashMap<String, String> params)throws Throwable;

}
