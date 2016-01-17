package com.atuigu.crm.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.atguigu.ssps.modules.persistence.SearchFilter;
import com.atguigu.ssps.modules.persistence.SearchFilter.Operator;
import com.atuigu.crm.entity.Customer;
import com.atuigu.crm.entity.CustomerActivity;
import com.atuigu.crm.web.ContactController;
import com.atuigu.crm.web.CustomerActivityController;

@Service
public class CustomerActivityService extends BaseService<CustomerActivity>{

	@Override
	protected Map<String, SearchFilter> buildSearchFilters() {
		Customer customer = CustomerActivityController.customers.get();
		ContactController.customers.remove();
		
		Map<String, SearchFilter> map = new HashMap<String, SearchFilter>();
		map.put("customer", new SearchFilter("customer", Operator.EQ, customer)); 
		
		return map;
	}
	
}
