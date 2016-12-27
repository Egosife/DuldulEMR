package com.duldul.emr.web.emr.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ManDao implements IManDao{

    @Autowired
    public SqlMapClient sqlMapClient; 

    @SuppressWarnings("unchecked")
    @Override
    public ArrayList<HashMap<String, String>> ManEmpList(HashMap<String, String> params) throws Throwable {
       return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("Manager.ManEmpList", params); 
    }
    @Override
    public int getManCount(HashMap<String, String> params) throws Throwable { 
  	  return (int) sqlMapClient.queryForObject("Manager.getManCount", params);
    }
}
