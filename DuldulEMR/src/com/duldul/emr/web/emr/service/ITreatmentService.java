package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface ITreatmentService {

	ArrayList<HashMap<String, String>> getPatient(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getPatient_info(HashMap<String, String> params) throws Throwable;

	String treat_commit(HashMap<String, String> params) throws Throwable;

	String treat_commit_time(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getTreatSEQ() throws Throwable;

	ArrayList<HashMap<String, String>> getTreatType() throws Throwable;

	ArrayList<HashMap<String, String>> gettreatsort_type() throws Throwable;
}
