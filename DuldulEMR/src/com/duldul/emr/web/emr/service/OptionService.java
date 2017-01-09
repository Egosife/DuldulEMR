package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duldul.emr.web.emr.dao.IOptionDao;

@Service
public class OptionService implements IOptionService {
	
	@Autowired
	public IOptionDao iOptionDao;

	@Override
	public ArrayList<HashMap<String, String>> getHosinfo(HashMap<String, String> params) throws Throwable {
		return iOptionDao.getHosinfo(params);
	}

	@Override
	public ArrayList<HashMap<String, String>> getempinfo(HashMap<String, String> params) throws Throwable {
		return iOptionDao.getempinfo(params);
	}

	@Override
	public HashMap<String, String> getuphosinfo(HashMap<String, String> params) throws Throwable {
		return iOptionDao.getuphosinfo(params);
	}

	@Override
	public int getupdhos(HashMap<String, String> params) throws Throwable {
		return iOptionDao.getupdhos(params);
	}

	@Override
	public String admincrehosin(HashMap<String, String> params) throws Throwable {
		return iOptionDao.admincrehosin(params);
	}

	@Override
	public HashMap<String, String> getHospitalSEQ() throws Throwable {
		return iOptionDao.getHospitalSEQ();
	}

	@Override
	public ArrayList<HashMap<String, String>> getposition_select() throws Throwable {
		return iOptionDao.getposition_select();
	}

	@Override
	public ArrayList<HashMap<String, String>> getoffice_select() throws Throwable {
		return iOptionDao.getoffice_select();
	}

	@Override
	public ArrayList<HashMap<String, String>> getlevel_select() throws Throwable {
		return iOptionDao.getlevel_select();
	}
}
