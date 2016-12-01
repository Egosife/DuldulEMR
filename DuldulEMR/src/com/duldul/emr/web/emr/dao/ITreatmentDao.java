package com.duldul.emr.web.emr.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface ITreatmentDao {

	ArrayList<HashMap<String, String>> getPatient(HashMap<String, String> params) throws Throwable;
}
