package com.duldul.emr.web.Hospital_Chart_Bean;

public class Hospital_Bean {
	public Hospital_Bean(int size) {
		data = new int[size];
	}
	
	private String name;
	private int[] data;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int[] getData() {
		return data;
	}
	public void setData(int[] data) {
		this.data = data;
	}
}
