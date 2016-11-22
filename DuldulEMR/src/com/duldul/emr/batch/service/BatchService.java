package com.duldul.emr.batch.service;

import org.springframework.stereotype.Service;

@Service(value = "IBatchService")
public class BatchService implements IBatchService {

	@Override
	public void printSchedule() {
		System.out.println("======> IBatchService");
	}

}
