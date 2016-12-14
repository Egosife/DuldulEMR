package com.duldul.emr.web.emr.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class RestDao implements IRestDao{

    @Autowired
    public SqlMapClient sqlMapClient;
    
    @SuppressWarnings("unchecked")
    @Override
    public ArrayList<HashMap<String, String>> getRest(HashMap<String, String> params) throws Throwable {
       return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("Rest.getRest", params);
    }
    
    @Override
    public int getRestCount(HashMap<String, String> params) throws Throwable {
  	  return (int) sqlMapClient.queryForObject("Rest.getRestCount", params);
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public ArrayList<HashMap<String, String>> getRestList(HashMap<String, String> params) throws Throwable {
       return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("Rest.getRestList", params);
    }
}
