package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duldul.emr.web.emr.dao.IManDao;

@Service
public class ManService implements IManService {
	@Autowired
	public IManDao iManDao;

	@Override
	public ArrayList<HashMap<String, String>> ManEmpList(HashMap<String, String> params) throws Throwable {
		return iManDao.ManEmpList(params);
	}
	@Override
	public int getManCount(HashMap<String, String> params) throws Throwable {
		return iManDao.getManCount(params);
	}
	@Override
	public int Man_sayoung(HashMap<String, String> params) throws Throwable {
		return iManDao.Man_sayoung(params);
	}
	@Override
	public HashMap<String, String> actcheck(HashMap<String, String> params) throws Throwable {
		return iManDao.actcheck(params);
	}
	@Override
	public int Man_Reset(HashMap<String, String> params) throws Throwable {
		return iManDao.Man_Reset(params);
	}
	@Override
	public ArrayList<HashMap<String, String>> Manjinryolist(HashMap<String, String> params) throws Throwable {
		return iManDao.Manjinryolist(params);
	}
	@Override
	public int Manopt_sujeong(HashMap<String, String> params) throws Throwable {
		return iManDao.Manopt_sujeong(params);
	}
	@Override
	public HashMap<String, String> Manjinryolist2(HashMap<String, String> params) throws Throwable {
		return iManDao.Manjinryolist2(params);
	}
	@Override
	public int Manager_popup_check(HashMap<String, String> params) throws Throwable {
		return iManDao.Manager_popup_check(params);
	}
	@Override
	public String man_admin_opt(HashMap<String, String> params) throws Throwable {
		return iManDao.man_admin_opt(params);
	}
}
