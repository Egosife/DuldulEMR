package com.duldul.emr.web.emr.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class OptionDao implements IOptionDao {
	@Autowired
	public SqlMapClient sqlMapOption;

	@Override
	public ArrayList<HashMap<String, String>> getHosinfo(HashMap<String, String> params) throws Throwable {
		return (ArrayList<HashMap<String, String>>) sqlMapOption.queryForList("Option.getHosinfo",params);
	}

	@Override
	public ArrayList<HashMap<String, String>> getempinfo(HashMap<String, String> params) throws Throwable {
		return (ArrayList<HashMap<String, String>>) sqlMapOption.queryForList("Option.getempinfo",params);
	}

	@Override
	public HashMap<String, String> getuphosinfo(HashMap<String, String> params) throws Throwable {
		return (HashMap<String, String>) sqlMapOption.queryForObject("Option.getuphosinfo",params);
	}

	@Override
	public int getupdhos(HashMap<String, String> params) throws Throwable {
		return sqlMapOption.update("Option.getupdhos",params);
	}

	@Override
	public String admincrehosin(HashMap<String, String> params) throws Throwable {
		String res = "false";
		
		//트랜잭션 생성
		//한번에 여러건을 수정 할 시 에러를 대비.
		sqlMapOption.startTransaction(); // 여기부터 트랜잭션을 시작하겠다.
		sqlMapOption.startBatch(); // 한번에 몇십천건 을 수정할 땐 배치를 쓰는게 좋음.
		
		//작업이 완료 됬을 시 커밋.
		try{
			sqlMapOption.insert("Option.admincrehosin",params);
			
			sqlMapOption.executeBatch(); // 쿼리를 한번에 날림
			sqlMapOption.commitTransaction(); //적용시킴
			
			res = "true";
		} catch (Exception e) {
			res = "false";
			e.printStackTrace();
			//에러가 나면 커밋이 안되므로  롤백이 됨
		}
		
		sqlMapOption.endTransaction(); //트랜잭션을 끝내겠다.
		
		return res;
	}

	@Override
	public HashMap<String, String> getHospitalSEQ() throws Throwable {
		return (HashMap<String, String>) sqlMapOption.queryForObject("Option.getHospitalSEQ");
	}

	@Override
	public ArrayList<HashMap<String, String>> getposition_select() throws Throwable {
		return (ArrayList<HashMap<String, String>>) sqlMapOption.queryForList("Option.getposition_select");
	}

	@Override
	public ArrayList<HashMap<String, String>> getoffice_select() throws Throwable {
		return (ArrayList<HashMap<String, String>>) sqlMapOption.queryForList("Option.getoffice_select");
	}

	@Override
	public ArrayList<HashMap<String, String>> getlevel_select() throws Throwable {
		return (ArrayList<HashMap<String, String>>) sqlMapOption.queryForList("Option.getlevel_select");
	}

	@Override
	public String admin_acc_register(HashMap<String, String> params) throws Throwable {
		String res = "false";
		
		//트랜잭션 생성
		//한번에 여러건을 수정 할 시 에러를 대비.
		sqlMapOption.startTransaction(); // 여기부터 트랜잭션을 시작하겠다.
		sqlMapOption.startBatch(); // 한번에 몇십천건 을 수정할 땐 배치를 쓰는게 좋음.
		
		//작업이 완료 됬을 시 커밋.
		try{
			sqlMapOption.insert("Option.admin_acc_register",params);
			
			sqlMapOption.executeBatch(); // 쿼리를 한번에 날림
			sqlMapOption.commitTransaction(); //적용시킴
			
			res = "true";
		} catch (Exception e) {
			res = "false";
			e.printStackTrace();
			//에러가 나면 커밋이 안되므로  롤백이 됨
		}
		
		sqlMapOption.endTransaction(); //트랜잭션을 끝내겠다.
		
		return res;
	}

	@Override
	public int admin_regi_id_chk(HashMap<String, String> params) throws Throwable {
		return (int) sqlMapOption.queryForObject("Option.admin_regi_id_chk",params);
	}

}
