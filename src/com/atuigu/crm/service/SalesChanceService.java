package com.atuigu.crm.service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atguigu.ssps.modules.persistence.DynamicSpecifications;
import com.atguigu.ssps.modules.persistence.SearchFilter;
import com.atguigu.ssps.modules.persistence.SearchFilter.Operator;
import com.atuigu.crm.entity.Contact;
import com.atuigu.crm.entity.Customer;
import com.atuigu.crm.entity.SalesChance;
import com.atuigu.crm.entity.User;
import com.atuigu.crm.repository.ContactRepository;
import com.atuigu.crm.repository.CustomerRepository;
import com.atuigu.crm.service.ShiroDbRealm.ShiroUser;

@Service
@Transactional
public class SalesChanceService extends BaseService<SalesChance>{
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private ContactRepository contactRepository;

	public void finish(Long id){
		//1. 状态变为 3
		SalesChance chance = repository.findOne(id);
		chance.setStatus(3);
		
		//2. 插入一条 Customer
		Customer customer = new Customer();
		customer.setName(chance.getCustName());
		customer.setNo(UUID.randomUUID().toString()); 
		customer.setState("正常"); 
		customerRepository.save(customer);
		
		//3. 插入一条 Contact
		Contact contact = new Contact();
		contact.setCustomer(customer);
		contact.setName(chance.getContact());
		contact.setTel(chance.getContactTel()); 
		contactRepository.save(contact);
	}
	
	public void stop(Long id) {
		SalesChance chance = repository.findOne(id);
		chance.setStatus(4); 
	}
	
	@Override
	protected Map<String, SearchFilter> buildSearchFilters() {
		Map<String, SearchFilter> filters = new HashMap<String, SearchFilter>();
		filters.put("status", new SearchFilter("status",  Operator.EQ, 1));
		
		return filters;
	}
	
	protected Specification<SalesChance> buildSpecification2(
			Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		
		filters.put("status", new SearchFilter("status",  Operator.NOTEQ, 1));
		
		ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		User user = new User(shiroUser.id);
		filters.put("designee", new SearchFilter("designee",  Operator.EQ, user));
		
		Specification<SalesChance> specification = 
				DynamicSpecifications.bySearchFilter(filters.values());
		return specification;
	}
	
	public Page<SalesChance> getSalesChancePage(Map<String, Object> searchParams, 
			int pageNumber, int pageSize){
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize);

		Specification<SalesChance> specification = buildSpecification2(searchParams);
		
		Page<SalesChance> page = repository.findAll(specification, pageRequest); 
		return page; 
	}

}
