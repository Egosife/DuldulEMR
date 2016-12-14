package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duldul.emr.web.emr.dao.IRestDao;

@Service
public class RestService implements IRestService {
	@Autowired
	public IRestDao iRestDao;

	@Override
	public ArrayList<HashMap<String, String>> getRest(HashMap<String, String> params) throws Throwable {
		return iRestDao.getRest(params);
	}
	@Override
	public int getRestCount(HashMap<String, String> params) throws Throwable {
		return iRestDao.getRestCount(params);
	}
	@Override
	public ArrayList<HashMap<String, String>> getRestList(HashMap<String, String> params) throws Throwable {
		return iRestDao.getRestList(params);
	}
}