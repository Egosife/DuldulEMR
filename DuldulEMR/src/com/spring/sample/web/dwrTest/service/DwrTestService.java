package com.spring.sample.web.dwrTest.service;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;

@RemoteProxy(name="IDwrTestService")
@Service
public class DwrTestService implements IDwrTestService {
	
	@RemoteMethod
	@Override
	public String test() {
		// TODO Auto-generated method stub
		return "호출되었다.";
	}

}
