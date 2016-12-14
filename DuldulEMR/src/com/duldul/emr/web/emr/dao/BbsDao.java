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
			return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("Bbs.getBbs", params);
		}
		
		@Override
		public int getBbsCount(HashMap<String, String> params) throws Throwable {
			return (int) sqlMapClient.queryForObject("Bbs.getBbsCount", params);
		}
		
		@SuppressWarnings("unchecked")
		@Override
		public HashMap<String, String> getBbsCon(HashMap<String, String> params) throws Throwable {
			
			return (HashMap<String, String>) sqlMapClient.queryForObject("Bbs.getBbsCon",params) ;
		}

		@Override
		public String insertTest(HashMap<String, String> params) throws Throwable {
			String res = "false";
			sqlMapClient.startTransaction();//여기서부터 transaction을 시작 
			sqlMapClient.startBatch();//한번에 수만건 쿼리를 수정할때 배치를 쓰는게 좋다
			
			
			//작업이 완료되었을때 commit
			try{
				sqlMapClient.insert("Bbs.insertTest",params);
				
				sqlMapClient.commitTransaction();//애가 commit적용
				sqlMapClient.executeBatch();//쿼리를 한번에 날림
				
				res="true";
			}catch (Exception e) { //에러가 나면 commit이 안되므로 롤백됨
				res="false";
				e.printStackTrace();
			}
			
			sqlMapClient.endTransaction(); //여기까지 transcation끝
			
			return res;
		}

		@Override
		public int deleteTest(HashMap<String, String> params) throws Throwable {
			// TODO Auto-generated method stub
			return sqlMapClient.delete("Bbs.deleteTest",params);
		}

		@Override
		public int updateTest(HashMap<String, String> params) throws Throwable {
		
			return sqlMapClient.update("Bbs.updateTest",params);
		}

		@Override
		public int visit(HashMap<String, String> params) throws Throwable {
			// TODO Auto-generated method stub
			return sqlMapClient.update("Bbs.visit", params);
		}
		@SuppressWarnings("unchecked")
		@Override
		public HashMap<String, String> getMaxPOST_Count(HashMap<String, String> params) throws Throwable {
			// TODO Auto-generated method stub
			return (HashMap<String, String>) sqlMapClient.queryForObject("Bbs.getMaxPOST_Count",params);
		}

		@Override
		public int main_notice2(HashMap<String, String> params) throws Throwable {
			// TODO Auto-generated method stub
			return (int) sqlMapClient.queryForObject("Bbs.main_notice2", params);
		}
		
		@SuppressWarnings("unchecked")//경고를 무시하겠다
		@Override
		public ArrayList<HashMap<String, String>> main_notice1(HashMap<String, String> params) throws Throwable {
			// TODO Auto-generated method stub
			return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("Bbs.main_notice1", params);
		}

		@Override
		public int main_bbs2(HashMap<String, String> params) throws Throwable {
			// TODO Auto-generated method stub
			return (int) sqlMapClient.queryForObject("Bbs.main_bbs2", params);
		}
		@SuppressWarnings("unchecked")//경고를 무시하겠다
		@Override
		public ArrayList<HashMap<String, String>> main_bbs1(HashMap<String, String> params) throws Throwable {
			// TODO Auto-generated method stub
			return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("Bbs.main_bbs1", params);
		}

		@Override
		public int main_rest2(HashMap<String, String> params) throws Throwable {
			// TODO Auto-generated method stub
			return (int) sqlMapClient.queryForObject("Bbs.main_rest2", params);
		}
		@SuppressWarnings("unchecked")//경고를 무시하겠다
		@Override
		public ArrayList<HashMap<String, String>> main_rest1(HashMap<String, String> params) throws Throwable {
			// TODO Auto-generated method stub
			return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("Bbs.main_rest1", params);
		}

		

}
