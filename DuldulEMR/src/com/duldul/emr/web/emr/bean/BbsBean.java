package com.duldul.emr.web.emr.bean;

public class BbsBean {
	public BbsBean(int size) {
		data = new int[size];
	}
	
	private String name;
	private int Interval;
	private int Start;
	private int[] data;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPointInterval() {
		return Interval;
	}
	public void setPointInterval(int pointInterval) {
		this.Interval = pointInterval;
	}
	public int getPointStart() {
		return Start;
	}
	public void setPointStart(int pointStart) {
		this.Start = pointStart;
	}
	public int[] getData() {
		return data;
	}
	public void setData(int[] data) {
		this.data = data;
	}
}
