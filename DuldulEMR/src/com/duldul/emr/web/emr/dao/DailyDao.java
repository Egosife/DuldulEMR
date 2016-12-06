package com.duldul.emr.web.emr.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class DailyDao implements IDailyDao {

      @Autowired
      public SqlMapClient sqlMapClient;
      
      @SuppressWarnings("unchecked")
      @Override
      public HashMap<String, String> getemp_List(HashMap<String, String> params) throws Throwable {
         return (HashMap<String, String>) sqlMapClient.queryForObject("Daily.getemp_List", params);
      }
      @SuppressWarnings("unchecked")
      @Override
      public ArrayList<HashMap<String, String>> getDaily(HashMap<String, String> params) throws Throwable {
         return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("Daily.getDaily", params);
      }
      
      @Override
      public int getDailyCount(HashMap<String, String> params) throws Throwable {
    	  return (int) sqlMapClient.queryForObject("Daily.getDailyCount", params);
      }
		@SuppressWarnings("unchecked")
		@Override
		public HashMap<String, String> getDailyCon(HashMap<String, String> params) throws Throwable {
			
			return (HashMap<String, String>) sqlMapClient.queryForObject("Daily.getDailyCon",params) ;
		}
      @Override
      public int dailyUpdate(HashMap<String, String> params) throws Throwable {
    	  return sqlMapClient.update("Daily.dailyUpdate",params);
		}
      
      @Override
      public int dailyDelete(HashMap<String, String> params) throws Throwable {
    	  return sqlMapClient.delete("Daily.dailyDelete",params);
      }
      
      @Override
      public String dailyInsert(HashMap<String, String> params) throws Throwable {
		String res = "false";
		
		//한 번에 여러 건을 수정할 때 에러를 대비
		sqlMapClient.startTransaction(); //트랜잭션 시작
		sqlMapClient.startBatch(); //한 번에 수만 건을 수정할 땐 배치를 쓰는게 좋다
		
		//작업이 완료 됐을 때 commit
		try{
			sqlMapClient.insert("Daily.dailyInsert",params);
			
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