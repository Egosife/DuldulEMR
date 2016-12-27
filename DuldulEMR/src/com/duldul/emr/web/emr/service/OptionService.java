package com.duldul.emr.web.emr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duldul.emr.web.emr.dao.IOptionDao;

@Service
public class OptionService implements IOptionService {
	
	@Autowired
	public IOptionDao iOptionDao;
}
