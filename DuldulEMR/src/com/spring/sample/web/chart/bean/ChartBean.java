package com.spring.sample.web.chart.bean;

public class ChartBean {
	public ChartBean(int size) {
		data = new int[size];
	}
	
	private String name;
	private int pointInterval;
	private int pointStart;
	private int[] data;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPointInterval() {
		return pointInterval;
	}
	public void setPointInterval(int pointInterval) {
		this.pointInterval = pointInterval;
	}
	public int getPointStart() {
		return pointStart;
	}
	public void setPointStart(int pointStart) {
		this.pointStart = pointStart;
	}
	public int[] getData() {
		return data;
	}
	public void setData(int[] data) {
		this.data = data;
	}
}
