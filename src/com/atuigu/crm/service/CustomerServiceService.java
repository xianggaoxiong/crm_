package com.atuigu.crm.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atguigu.ssps.modules.persistence.SearchFilter;
import com.atguigu.ssps.modules.persistence.SearchFilter.Operator;
import com.atuigu.crm.entity.CustomerService;
import com.atuigu.crm.web.CustomerServiceController;

@Transactional
@Service
public class CustomerServiceService extends BaseService<CustomerService>{

	@Override
	protected Map<String, SearchFilter> buildSearchFilters() {
		String state = CustomerServiceController.states.get();
		Map<String, SearchFilter> filters = new HashMap<String, SearchFilter>();
		filters.put("serviceState", new SearchFilter("serviceState", Operator.EQ, state)); 
		return filters;
	}
	
}
