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
    @Override
    public String restInsert(HashMap<String, String> params) throws Throwable {
		String res = "false";
		
		//한 번에 여러 건을 수정할 때 에러를 대비
		sqlMapClient.startTransaction(); //트랜잭션 시작
		sqlMapClient.startBatch(); //한 번에 수만 건을 수정할 땐 배치를 쓰는게 좋다
		
		//작업이 완료 됐을 때 commit
		try{
			sqlMapClient.insert("Rest.restInsert",params);
			
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
