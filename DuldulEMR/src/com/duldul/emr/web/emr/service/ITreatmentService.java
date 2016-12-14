package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface ITreatmentService {

	ArrayList<HashMap<String, String>> getPatient(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getPatient_info(HashMap<String, String> params) throws Throwable;

	String treat_commit(HashMap<String, String> params) throws Throwable;

	String treat_commit_time(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getTreatSEQ() throws Throwable;

	ArrayList<HashMap<String, String>> getTreatType() throws Throwable;

	ArrayList<HashMap<String, String>> gettreatsort_type() throws Throwable;

	ArrayList<HashMap<String, String>> getdoctor(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getpatiinfo(HashMap<String, String> params) throws Throwable;

	ArrayList<HashMap<String, String>> gettreatinfo(HashMap<String, String> params) throws Throwable;

	ArrayList<HashMap<String, String>> getpillinfo(HashMap<String, String> params) throws Throwable;

	String inserttreathis(HashMap<String, String> params) throws Throwable;

	int updatetreat(HashMap<String, String> params) throws Throwable;

	String inserttreatmore(HashMap<String, String> params) throws Throwable;

	String inserttreatcare(List<String> patinum, List<String> treatnum, List<String> treatcare) throws Throwable;

	String inserttreatpill(List<String> patinum, List<String> treatnum, List<String> treatpill) throws Throwable;

	ArrayList<HashMap<String, String>> getcareinfo(HashMap<String, String> params) throws Throwable;

	ArrayList<HashMap<String, String>> getTodayTreat(HashMap<String, String> params) throws Throwable;

	int updatetime(HashMap<String, String> params) throws Throwable;

}
