package com.duldul.emr.batch.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.duldul.emr.batch.service.IBatchService;

public class BatchController {
	@Autowired
	public IBatchService iBatchService;
	
	public void startBatch() {
		System.out.println("========> Start Batch");
		
		iBatchService.printSchedule();
		
		System.out.println("========> End Batch");
	}
}







