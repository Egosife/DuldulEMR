package com.duldul.emr.web.emr.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class LogonDao implements ILogonDao {
	@Autowired
	public SqlMapClient sqlMapC;

	@Override
	public HashMap<String, String> getAcc(HashMap<String, String> params) throws Throwable {
		return (HashMap<String, String>) sqlMapC.queryForObject("emr.getAcc",params);
	}
}
