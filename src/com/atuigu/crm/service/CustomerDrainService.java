package com.atuigu.crm.service;

import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atuigu.crm.entity.CustomerDrain;

@Service
@Transactional
public class CustomerDrainService extends BaseService<CustomerDrain>{
	
	public void drain(CustomerDrain customerDrain){
		customerDrain.setStatus("流失");
		customerDrain.setDrainDate(new Date()); 
		repository.save(customerDrain);
		
		customerDrain.getCustomer().setState("流失");
	}
	
}
