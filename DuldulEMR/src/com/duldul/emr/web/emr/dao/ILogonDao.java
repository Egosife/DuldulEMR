package com.duldul.emr.web.emr.dao;

import java.util.HashMap;

public interface ILogonDao {
	public HashMap<String, String> getAcc(HashMap<String, String> params)throws Throwable;
}
