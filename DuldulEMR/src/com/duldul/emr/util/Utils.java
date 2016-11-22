package com.duldul.emr.util;

import java.text.SimpleDateFormat;

import org.apache.commons.lang.RandomStringUtils;

public class Utils {
	/**
	* Primary Key 생성
	* @return String
	*/
		public static String getPrimaryKey() {
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyyMMddHHmmss");
		return formatter.format(new java.util.Date()) + RandomStringUtils.randomNumeric(6);
		}
}
