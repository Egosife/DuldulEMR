package com.duldul.emr.web.login.service;

import com.duldul.emr.web.login.bean.LoginBean;

public interface ILoginService {

	public LoginBean getUserInfo(LoginBean lb) throws Throwable;

}
