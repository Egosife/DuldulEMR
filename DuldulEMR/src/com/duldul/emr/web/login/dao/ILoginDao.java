package com.duldul.emr.web.login.dao;

import com.duldul.emr.web.login.bean.LoginBean;

public interface ILoginDao {

	public LoginBean getUserInfo(LoginBean lb) throws Throwable;

}
