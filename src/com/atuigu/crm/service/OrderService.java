package com.atuigu.crm.service;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.criteria.Predicate;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atguigu.ssps.modules.persistence.SearchFilter;
import com.atguigu.ssps.modules.persistence.SearchFilter.Operator;
import com.atuigu.crm.entity.Customer;
import com.atuigu.crm.entity.Order;
import com.atuigu.crm.web.ContactController;
import com.atuigu.crm.web.OrderController;

@Service
public class OrderService extends BaseService<Order>{

	@Override
	protected Map<String, SearchFilter> buildSearchFilters() {
		Customer customer = OrderController.customers.get();
		ContactController.customers.remove();
		
		Map<String, SearchFilter> map = new HashMap<String, SearchFilter>();
		if(customer != null){
			map.put("customer", new SearchFilter("customer", Operator.EQ, customer)); 
		}
		
		return map;
	}
	
}
