package com.duldul.emr.web.emr.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class TreatmentDao implements ITreatmentDao {
	@Autowired
	public SqlMapClient sqlMaptreat;

	@Override
	public ArrayList<HashMap<String, String>> getPatient(HashMap<String, String> params) throws Throwable {
		return (ArrayList<HashMap<String, String>>) sqlMaptreat.queryForList("Treat.getPatient",params);
	}
}
