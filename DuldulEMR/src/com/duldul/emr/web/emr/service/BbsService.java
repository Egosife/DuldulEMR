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

	@Override
	public int deleteTest(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBbsDao.deleteTest(params);
	}

	@Override
	public int updateTest(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBbsDao.updateTest(params);
	}

	@Override
	public int visit(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBbsDao.visit(params);
	}

	@Override
	public HashMap<String, String> getMaxPOST_Count(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBbsDao.getMaxPOST_Count(params);
	}

	@Override
	public int main_notice2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBbsDao.main_notice2(params);
	}

	@Override
	public ArrayList<HashMap<String, String>> main_notice1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBbsDao.main_notice1(params);
	}

	@Override
	public int main_bbs2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBbsDao.main_bbs2(params);
	}

	@Override
	public ArrayList<HashMap<String, String>> main_bbs1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBbsDao.main_bbs1(params);
	}

	@Override
	public int main_rest2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBbsDao.main_rest2(params);
	}

	@Override
	public ArrayList<HashMap<String, String>> main_rest1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBbsDao.main_rest1(params);
	}



	

}
