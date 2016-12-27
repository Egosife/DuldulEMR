package com.duldul.emr.web.emr.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class OptionDao implements IOptionDao {
	@Autowired
	public SqlMapClient sqlMapOption;
}
