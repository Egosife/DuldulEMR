package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface ITreatmentService {

	ArrayList<HashMap<String, String>> getPatient(HashMap<String, String> params) throws Throwable;
}
