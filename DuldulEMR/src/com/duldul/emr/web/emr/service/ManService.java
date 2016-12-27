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
}
