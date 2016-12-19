package com.duldul.emr.web.emr.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

@Service
public interface IRestService {
	//나의 신청 현황 및 기록 데이터 가져오기
	public ArrayList<HashMap<String, String>> getRest(HashMap<String, String> params) throws Throwable;
	
	//페이징 처리
	public int getRestCount(HashMap<String, String> params) throws Throwable;
	
	public ArrayList<HashMap<String, String>> getRestList(HashMap<String, String> params) throws Throwable;
	
	public HashMap<String, String> getRestCon(HashMap<String, String> params) throws Throwable;
	
	public String restInsert(HashMap<String, String> params) throws Throwable;
	
	public int detail_sujeong(HashMap<String, String> params) throws Throwable;
	
	public int detail_sakje(HashMap<String, String> params) throws Throwable;
}
