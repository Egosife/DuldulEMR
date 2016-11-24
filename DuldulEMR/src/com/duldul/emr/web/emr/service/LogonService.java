package com.duldul.emr.web.emr.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duldul.emr.web.emr.dao.ILogonDao;

@Service
public class LogonService implements ILogonService {
	
	@Autowired
	public ILogonDao iLogonDao;
	
	@Override
	public HashMap<String, String> getAcc(HashMap<String, String> params) throws Throwable {
		return iLogonDao.getAcc(params);
	}

}
