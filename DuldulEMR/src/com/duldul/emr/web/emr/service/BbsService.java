package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duldul.emr.web.emr.dao.IBbsDao;

@Service
public class BbsService implements IBbsService{

	@Autowired
	public IBbsDao iBbsDao;

	@Override
	public ArrayList<HashMap<String, String>> getBbs(HashMap<String, String> params)throws Throwable {
		
		return iBbsDao.getBbs(params);
	}
	
	@Override
	public int getBbsCount(HashMap<String, String> params)throws Throwable {
		
		return iBbsDao.getBbsCount(params);
	}

	@Override
	public HashMap<String, String> getBbsCon(HashMap<String, String> params) throws Throwable {
		
		return iBbsDao.getBbsCon(params);
	}

	@Override
	public String insertTest(HashMap<String, String> params) throws Throwable {
		
		return  iBbsDao.insertTest(params);
	}



	

}
