package com.spring.sample.web.login.dao;

import com.spring.sample.web.login.bean.LoginBean;

public interface ILoginDao {

	public LoginBean getUserInfo(LoginBean lb) throws Throwable;

}
