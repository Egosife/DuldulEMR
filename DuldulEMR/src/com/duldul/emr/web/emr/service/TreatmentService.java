package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

	@Override
	public ArrayList<HashMap<String, String>> getdoctor(HashMap<String, String> params) throws Throwable {
		return iTreatmentDao.getdoctor(params);
	}

	@Override
	public HashMap<String, String> getpatiinfo(HashMap<String, String> params) throws Throwable {
		return iTreatmentDao.getpatiinfo(params);
	}

	@Override
	public ArrayList<HashMap<String, String>> gettreatinfo(HashMap<String, String> params) throws Throwable {
		return iTreatmentDao.gettreatinfo(params);
	}

	@Override
	public ArrayList<HashMap<String, String>> getpillinfo(HashMap<String, String> params) throws Throwable {
		return iTreatmentDao.getpillinfo(params);
	}

	@Override
	public String inserttreathis(HashMap<String, String> params) throws Throwable {
		return iTreatmentDao.inserttreathis(params);
	}

	@Override
	public int updatetreat(HashMap<String, String> params) throws Throwable {
		return iTreatmentDao.updatetreat(params);
	}

	@Override
	public String inserttreatmore(HashMap<String, String> params) throws Throwable {
		return iTreatmentDao.inserttreatmore(params);
	}

	@Override
	public String inserttreatcare(List<String> patinum, List<String> treatnum, List<String> treatcare)
			throws Throwable {
		return iTreatmentDao.inserttreatcare(patinum,treatnum,treatcare);
	}

	@Override
	public String inserttreatpill(List<String> patinum, List<String> treatnum, List<String> treatpill)
			throws Throwable {
		return iTreatmentDao.inserttreatpill(patinum,treatnum,treatpill);
	}

	@Override
	public ArrayList<HashMap<String, String>> getcareinfo(HashMap<String, String> params) throws Throwable {
		return iTreatmentDao.getcareinfo(params);
	}

	@Override
	public ArrayList<HashMap<String, String>> getTodayTreat(HashMap<String, String> params) throws Throwable {
		return iTreatmentDao.getTodayTreat(params);
	}

	@Override
	public int updatetime(HashMap<String, String> params) throws Throwable {
		return iTreatmentDao.updatetime(params);
	}

}
