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

	@Override
	public HashMap<String, String> getPatient_info(HashMap<String, String> params) throws Throwable {
		return (HashMap<String, String>) sqlMaptreat.queryForObject("Treat.getPatient_info",params);
	}

	@Override
	public String treat_commit(HashMap<String, String> params) throws Throwable {
		String res = "false";
		
		//트랜잭션 생성
		//한번에 여러건을 수정 할 시 에러를 대비.
		sqlMaptreat.startTransaction(); // 여기부터 트랜잭션을 시작하겠다.
		sqlMaptreat.startBatch(); // 한번에 몇십천건 을 수정할 땐 배치를 쓰는게 좋음.
		
		//작업이 완료 됬을 시 커밋.
		try{
			sqlMaptreat.insert("Treat.treat_commit",params);
			
			sqlMaptreat.executeBatch(); // 쿼리를 한번에 날림
			sqlMaptreat.commitTransaction(); //적용시킴
			
			res = "true";
		} catch (Exception e) {
			res = "false";
			e.printStackTrace();
			//에러가 나면 커밋이 안되므로  롤백이 됨
		}
		
		sqlMaptreat.endTransaction(); //트랜잭션을 끝내겠다.
		
		return res;
	}

	@Override
	public String treat_commit_time(HashMap<String, String> params) throws Throwable {
		String res = "false";
		
		//트랜잭션 생성
		//한번에 여러건을 수정 할 시 에러를 대비.
		sqlMaptreat.startTransaction(); // 여기부터 트랜잭션을 시작하겠다.
		sqlMaptreat.startBatch(); // 한번에 몇십천건 을 수정할 땐 배치를 쓰는게 좋음.
		
		//작업이 완료 됬을 시 커밋.
		try{
			sqlMaptreat.insert("Treat.treat_commit_time",params);
			
			sqlMaptreat.executeBatch(); // 쿼리를 한번에 날림
			sqlMaptreat.commitTransaction(); //적용시킴
			
			res = "true";
		} catch (Exception e) {
			res = "false";
			e.printStackTrace();
			//에러가 나면 커밋이 안되므로  롤백이 됨
		}
		
		sqlMaptreat.endTransaction(); //트랜잭션을 끝내겠다.
		
		return res;
	}

	@Override
	public HashMap<String, String> getTreatSEQ() throws Throwable {
		return (HashMap<String, String>) sqlMaptreat.queryForObject("Treat.getTreatSEQ");
	}

	@Override
	public ArrayList<HashMap<String, String>> getTreatType() throws Throwable {
		return (ArrayList<HashMap<String, String>>) sqlMaptreat.queryForList("Treat.getTreatType");
	}

	@Override
	public ArrayList<HashMap<String, String>> gettreatsort_type() throws Throwable {
		return (ArrayList<HashMap<String, String>>) sqlMaptreat.queryForList("Treat.gettreatsort_type");
	}

	@Override
	public ArrayList<HashMap<String, String>> getdoctor(HashMap<String, String> params) throws Throwable {
		return (ArrayList<HashMap<String, String>>) sqlMaptreat.queryForList("Treat.getdoctor",params);
	}
}
