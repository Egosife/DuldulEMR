package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duldul.emr.web.emr.dao.IDailyDao;

@Service
public class DailyService implements IDailyService {
	
	@Autowired
	public IDailyDao iDailyDao;
	
	@Override
	public HashMap<String, String> getemp_List(HashMap<String, String> params) throws Throwable {
		return iDailyDao.getemp_List(params);
	}
	@Override
	public ArrayList<HashMap<String, String>> getDaily(HashMap<String, String> params) throws Throwable {
		return iDailyDao.getDaily(params);
	}
	@Override
	public int getDailyCount(HashMap<String, String> params) throws Throwable {
		return iDailyDao.getDailyCount(params);
	}
	@Override
	public HashMap<String, String> getDailyCon(HashMap<String, String> params) throws Throwable {
		
		return iDailyDao.getDailyCon(params);
	}
	@Override
	public String dailyInsert(HashMap<String, String> params) throws Throwable {
		return iDailyDao.dailyInsert(params);
	}
	@Override
	public int dailyUpdate(HashMap<String, String> params) throws Throwable {
		return iDailyDao.dailyUpdate(params);
	}
	@Override
	public int dailyDelete(HashMap<String, String> params) throws Throwable {
		return iDailyDao.dailyDelete(params);
	}
}