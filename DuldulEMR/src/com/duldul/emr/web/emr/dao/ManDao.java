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
    @Override
    public int Man_sayoung(HashMap<String, String> params) throws Throwable {
  	  return sqlMapClient.update("Manager.Man_sayoung",params);
	}
    @SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> actcheck(HashMap<String, String> params) throws Throwable {
		return (HashMap<String, String>) sqlMapClient.queryForObject("Manager.actcheck",params);
	}
	@Override
	public int Man_Reset(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("Manager.Man_Reset",params);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> Manjinryolist(HashMap<String, String> params) throws Throwable  {
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("Manager.Manjinryolist", params);
	}
	@Override
	public int Manopt_sujeong(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("Manager.Manopt_sujeong",params);
	}
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> Manjinryolist2(HashMap<String, String> params) throws Throwable {
		return (HashMap<String, String>) sqlMapClient.queryForObject("Manager.Manjinryolist2", params);
	}
	@Override
	public int Manager_popup_check(HashMap<String, String> params) throws Throwable {
		return (int) sqlMapClient.queryForObject("Manager.Manager_popup_check",params);
	}
	@Override
	public String man_admin_opt(HashMap<String, String> params) throws Throwable {
		String res = "false";
		
		//한 번에 여러 건을 수정할 때 에러를 대비
		sqlMapClient.startTransaction(); //트랜잭션 시작
		sqlMapClient.startBatch(); //한 번에 수만 건을 수정할 땐 배치를 쓰는게 좋다
		
		//작업이 완료 됐을 때 commit
		try{
			sqlMapClient.insert("Manager.man_insert",params);
			
			sqlMapClient.executeBatch(); //쿼리를 한 번에 날림
			sqlMapClient.commitTransaction(); // commit 적용
			res = "true";
		}catch (Exception e){ //error가 나면 commit이 안되므로 rollback이 됌
			res = "false";
			e.printStackTrace();
		}
		sqlMapClient.endTransaction();
  	 return res;
	}
}
