package com.atuigu.crm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.atguigu.ssps.modules.persistence.SearchFilter;
import com.atguigu.ssps.modules.persistence.SearchFilter.Operator;
import com.atuigu.crm.entity.Contact;
import com.atuigu.crm.entity.Customer;
import com.atuigu.crm.repository.ContactRepository;
import com.atuigu.crm.repository.CustomerRepository;
import com.atuigu.crm.web.ContactController;
import com.atuigu.crm.web.CustomerController;

@Service
public class ContactService extends BaseService<Contact>{

	public List<Contact> getManagersByCustomer(Long mgrId){
		Customer customer = new Customer();
		customer.setId(mgrId);
		
		return ((ContactRepository)repository).getContactByCustomer(customer);
	}
	
	@Override
	protected Map<String, SearchFilter> buildSearchFilters() {
		Customer customer = ContactController.customers.get();
		ContactController.customers.remove();
		
		Map<String, SearchFilter> map = new HashMap<String, SearchFilter>();
		map.put("customer", new SearchFilter("customer", Operator.EQ, customer)); 
		
		return map;
	}
	
}
