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

	@Override
	public HashMap<String, String> getPatient_info(HashMap<String, String> params) throws Throwable {
		return iTreatmentDao.getPatient_info(params);
	}

	@Override
	public String treat_commit(HashMap<String, String> params) throws Throwable {
		return iTreatmentDao.treat_commit(params);
	}

	@Override
	public String treat_commit_time(HashMap<String, String> params) throws Throwable {
		return iTreatmentDao.treat_commit_time(params);
	}

	@Override
	public HashMap<String, String> getTreatSEQ() throws Throwable {
		return iTreatmentDao.getTreatSEQ();
	}

	@Override
	public ArrayList<HashMap<String, String>> getTreatType() throws Throwable {
		return iTreatmentDao.getTreatType();
	}

	@Override
	public ArrayList<HashMap<String, String>> gettreatsort_type() throws Throwable {
		return iTreatmentDao.gettreatsort_type();
	}
	
}
