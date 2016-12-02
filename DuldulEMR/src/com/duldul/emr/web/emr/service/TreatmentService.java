package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duldul.emr.web.emr.dao.ITreatmentDao;

@Service
public class TreatmentService implements ITreatmentService {
	
	@Autowired
	public ITreatmentDao iTreatmentDao;

	@Override
	public ArrayList<HashMap<String, String>> getPatient(HashMap<String, String> params) throws Throwable {
		return iTreatmentDao.getPatient(params);
	}
	
}
