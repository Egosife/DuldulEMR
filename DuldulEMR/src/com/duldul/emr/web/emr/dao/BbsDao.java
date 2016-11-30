package com.duldul.emr.web.emr.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class BbsDao implements IBbsDao {

		@Autowired
		public SqlMapClient sqlMapClient;
		
		@SuppressWarnings("unchecked")//경고를 무시하겠다
		@Override
		
		public ArrayList<HashMap<String, String>> getBbs(HashMap<String, String> params) throws Throwable {
			return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("emr.getBbs", params);
		}
		
		@Override
		public int getBbsCount(HashMap<String, String> params) throws Throwable {
			return (int) sqlMapClient.queryForObject("Bbs.getBbsCount", params);
		}

		

}
