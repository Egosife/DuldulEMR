package com.duldul.emr.web.emr.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface IBbsDao {

	ArrayList<HashMap<String, String>> getBbs(HashMap<String, String> params)throws Throwable;

	int getBbsCount(HashMap<String, String> params)throws Throwable;

	


}
