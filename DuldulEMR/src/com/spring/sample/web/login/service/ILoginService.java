package com.spring.sample.web.login.service;

import com.spring.sample.web.login.bean.LoginBean;

public interface ILoginService {

	public LoginBean getUserInfo(LoginBean lb) throws Throwable;

}
