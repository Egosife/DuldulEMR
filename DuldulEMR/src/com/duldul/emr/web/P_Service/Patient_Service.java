package com.duldul.emr.web.P_Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duldul.emr.web.P_Dao.Patient_iDao;

@Service
public class Patient_Service implements Patient_iService { //2016-11-30 이관우 서비스클래스 작성
	
	@Autowired
	public Patient_iDao Patient_Dao;
	
	@Override
	public int Patient_Count(HashMap<String, String> pari) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.Patient_Count(pari);
	} //환자조회 서비스클래스

	@Override
	public ArrayList<HashMap<String, String>> patient_DataList(HashMap<String, String> pari) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.patient_DataList(pari);
	} //환자조회 서비스클래스
	
	@Override
	public int EMP_Count(HashMap<String, String> parang) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.EMP_Count(parang);
	} //직원조회 서비스클래스

	@Override
	public ArrayList<HashMap<String, String>> EMP_DataList(HashMap<String, String> parang) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.EMP_DataList(parang);
	} //직원조회 서비스클래스
	
	@Override
	public HashMap<String, String> getDetails_info(HashMap<String, String> padar_padar) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.getDetails_info(padar_padar);
	} //환자 상세조회 정보 서비스클래스
	
	@Override
	public ArrayList<HashMap<String, String>> Det_DataList(HashMap<String, String> padar_padar) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.Det_DataList(padar_padar);
	} //진단기록 서비스클래스
	
	@Override
	public ArrayList<HashMap<String, String>> Det_DataList2(HashMap<String, String> padar_padar_padar) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.Det_DataList2(padar_padar_padar);
	} //처방기록 서비스클래스

	@Override
	public HashMap<String, String> insert_SEQ() throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.insert_SEQ();
	} //SEQ.NEXTVAL 서비스클래스
	
	@Override
	public String pat_insert(HashMap<String, String> paprika) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.pat_insert(paprika);
	} //환자정보 서비스클래스
	
	@Override
	public String patmore_insert(HashMap<String, String> paprika) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.patmore_insert(paprika);
	} //환자추가정보 서비스클래스
	
	@Override
	public int Set_Count(HashMap<String, String> parigee) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.Set_Count(parigee);
	} //환자일정 조회 서비스클래스

	@Override
	public ArrayList<HashMap<String, String>> Set_DataList(HashMap<String, String> parigee) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.Set_DataList(parigee);
	} //환자일정 조회 서비스클래스
	
	@Override
	public ArrayList<HashMap<String, String>> Selectsort_type() throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.Selectsort_type();
	} //진료과 타입 서비스클래스

	@Override
	public ArrayList<HashMap<String, String>> get_Selectdoc(HashMap<String, String> papamama) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.get_Selectdoc(papamama);
	} //진료의사 타입 서비스클래스
	
	@Override
	public HashMap<String, String> getService_info(HashMap<String, String> sheep_paring) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.getService_info(sheep_paring);
	} //회원정보수정 데이터 서비스클래스
	
	@Override
	public int update_Service(HashMap<String, String> Yora_Fire) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.update_Service(Yora_Fire);
	} //회원정보수정 서비스클래스
	
	@Override
	public HashMap<String, String> getPassword_info(HashMap<String, String> Mambos) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.getPassword_info(Mambos);
	} //비밀번호 확인 데이터 서비스클래스
	
	@Override
	public int update_Password(HashMap<String, String> Mambos) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.update_Password(Mambos);
	} //비밀번호 변경 서비스클래스
	
	@Override
	public ArrayList<HashMap<String, String>> Hos_chart_Data(HashMap<String, String> chacha) throws Throwable {
		// TODO Auto-generated method stub
		return Patient_Dao.Hos_chart_Data(chacha);
	} //병원현황 차트 서비스클래스

}
