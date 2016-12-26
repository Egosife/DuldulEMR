package com.duldul.emr.web.P_Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class Patient_Dao implements Patient_iDao { //2016-11-30 이관우 디에이오클래스 작성
	
	@Autowired
	public SqlMapClient sqlMapC_t;
	
	@Override
	public int Patient_Count(HashMap<String, String> pari) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapC_t.queryForObject("Patient_Data.Pat_Count", pari); //sql id 지정
	} //환자조회 디에이오 클래스
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> patient_DataList(HashMap<String, String> pari) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapC_t.queryForList("Patient_Data.pat_DataList", pari); //sql id 지정
	} //환자조회 디에이오 클래스
	
	@Override
	public int EMP_Count(HashMap<String, String> parang) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapC_t.queryForObject("Patient_Data.Emp_Count", parang); //sql id 지정
	} //직원조회 디에이오 클래스
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> EMP_DataList(HashMap<String, String> parang) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapC_t.queryForList("Patient_Data.Emp_DataList", parang); //sql id 지정
	} //직원조회 디에이오 클래스
	
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getDetails_info(HashMap<String, String> padar_padar) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapC_t.queryForObject("Patient_Data.Details_DataList", padar_padar);
	} //환자 상세조회 인터페이스 디에이오 클래스
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> Det_DataList(HashMap<String, String> padar_padar) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapC_t.queryForList("Patient_Data.Det_DataList", padar_padar); //sql id 지정
	} //진단기록 디에이오 클래스
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> Det_DataList2(HashMap<String, String> padar_padar_padar) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapC_t.queryForList("Patient_Data.Det_DataList2", padar_padar_padar); //sql id 지정
	} //처방기록 디에이오 클래스
	
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> insert_SEQ() throws Throwable {
		return (HashMap<String, String>) sqlMapC_t.queryForObject("Patient_Data.insert_SEQ_NEXTVAL");
	} //SEQ.NEXTVAL 디에이오 클래스
	
	@Override
	public String pat_insert(HashMap<String, String> paprika) throws Throwable {
		String res = "false";
		
		//트랜잭션 생성
		//한번에 여러건을 수정 할 시 에러를 대비.
		sqlMapC_t.startTransaction(); // 여기부터 트랜잭션을 시작하겠다.
		sqlMapC_t.startBatch(); // 한번에 몇십천건 을 수정할 땐 배치를 쓰는게 좋음.
		
		//작업이 완료 됬을 시 커밋.
		try{
			sqlMapC_t.insert("Patient_Data.pat_insert", paprika);
			
			sqlMapC_t.executeBatch(); // 쿼리를 한번에 날림
			sqlMapC_t.commitTransaction(); //적용시킴
			
			res = "true";
		} catch (Exception e) {
			res = "false";
			e.printStackTrace();
			//에러가 나면 커밋이 안되므로  롤백이 됨
		}
		
		sqlMapC_t.endTransaction(); //트랜잭션을 끝내겠다.
		
		return res;
	} //환자정보 디에이오 클래스

	@Override
	public String patmore_insert(HashMap<String, String> paprika) throws Throwable {
		String res = "false";
		
		//트랜잭션 생성
		//한번에 여러건을 수정 할 시 에러를 대비.
		sqlMapC_t.startTransaction(); // 여기부터 트랜잭션을 시작하겠다.
		sqlMapC_t.startBatch(); // 한번에 몇십천건 을 수정할 땐 배치를 쓰는게 좋음.
		
		//작업이 완료 됬을 시 커밋.
		try{
			sqlMapC_t.insert("Patient_Data.patmore_insert", paprika);
			
			sqlMapC_t.executeBatch(); // 쿼리를 한번에 날림
			sqlMapC_t.commitTransaction(); //적용시킴
			
			res = "true";
		} catch (Exception e) {
			res = "false";
			e.printStackTrace();
			//에러가 나면 커밋이 안되므로  롤백이 됨
		}
		
		sqlMapC_t.endTransaction(); //트랜잭션을 끝내겠다.
		
		return res;
	} //환자추가정보 디에이오 클래스
	
	@Override
	public int Set_Count(HashMap<String, String> parigee) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapC_t.queryForObject("Patient_Data.Set_Count", parigee); //sql id 지정
	} //환자일정 조회 디에이오 클래스
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> Set_DataList(HashMap<String, String> parigee) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapC_t.queryForList("Patient_Data.Set_DataList", parigee); //sql id 지정
	} //환자일정 조회 디에이오 클래스
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> Selectsort_type() throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapC_t.queryForList("Patient_Data.St_Data");
	} //진료과 타입 받아오기 디에이오 클래스

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> get_Selectdoc(HashMap<String, String> papamama) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapC_t.queryForList("Patient_Data.Doc_data",papamama);
	} //진료의사 타입 받아오기 디에이오 클래스
	
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getService_info(HashMap<String, String> sheep_paring) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapC_t.queryForObject("Patient_Data.Service_Data", sheep_paring);
	} //회원정보수정 데이터 인터페이스 디에이오 클래스
	
	@Override
	public int update_Service(HashMap<String, String> Yora_Fire) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapC_t.update("Patient_Data.update_Service", Yora_Fire); //sql id 지정
	} //회원정보수정 디에이오 클래스
	
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getPassword_info(HashMap<String, String> Mambos) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapC_t.queryForObject("Patient_Data.Password_Data", Mambos);
	} //비밀번호 확인 인터페이스 디에이오 클래스
	
	@Override
	public int update_Password(HashMap<String, String> Mambos) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapC_t.update("Patient_Data.update_Password", Mambos); //sql id 지정
	} //비밀번호 변경 인터페이스 디에이오 클래스
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> Hos_chart_Data(HashMap<String, String> chacha) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapC_t.queryForList("Patient_Data.Chart_Data", chacha);
	} //환자방문 차트 인터페이스 디에이오 클래스
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> Hos_chart_Data2(HashMap<String, String> chichi) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapC_t.queryForList("Patient_Data.Chart_Data2", chichi);
	} //환자구분 차트 인터페이스 디에이오 클래스
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> Hos_chart_Data3(HashMap<String, String> cheche) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapC_t.queryForList("Patient_Data.Chart_Data3", cheche);
	} //진료과별 남녀비율 차트 인터페이스 디에이오 클래스
}
