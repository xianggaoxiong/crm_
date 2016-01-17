package com.atuigu.crm.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atuigu.crm.entity.Customer;
import com.atuigu.crm.repository.CommonDao;

@Service
public class CustomerService extends BaseService<Customer>{
	
	@Autowired
	private CommonDao commonDao;
	
	@Transactional
	public Page<Customer> getCustomerPage(Map<String, Object> searchParams, 
			int pageNumber, int pageSize){
		String date1 = (String) searchParams.get("date1");
		String date2 = (String) searchParams.get("date2");
		String name = (String) searchParams.get("name");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date fromDate = null;
		Date toDate = null;

		try {
			fromDate = dateFormat.parse(date1);
		} catch (Exception e) {
			try {
				fromDate = dateFormat.parse("1900-01-01");
			} catch (ParseException e1) {}
		}
		
		try {
			toDate = dateFormat.parse(date2);
		} catch (Exception e) {
			try {
				toDate = dateFormat.parse("3000-12-31");
			} catch (ParseException e1) {}
		}
		
		if(name == null || name.trim().equals("")){
			name = "";
		}
		name = "%" + name + "%";
		
		return commonDao.getCustomerPage(pageNumber, pageSize, name, fromDate, toDate);
	}

	@Transactional
	public Page<Object[]> getConsistPage(Map<String, Object> searchParams,
			int pageNumber, int pageSize) {
		String type = (String) searchParams.get("type");
		if(type == null)
			type = "level";
		
		return commonDao.getConsistPage(pageNumber, pageSize, type);
	}
	
	@Transactional
	public Page<Object[]> getServicePage(Map<String, Object> searchParams,
			int pageNumber, int pageSize) {
		
		String date1 = (String) searchParams.get("date1");
		String date2 = (String) searchParams.get("date2");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date fromDate = null;
		Date toDate = null;

		try {
			fromDate = dateFormat.parse(date1);
		} catch (Exception e) {
			try {
				fromDate = dateFormat.parse("1900-01-01");
			} catch (ParseException e1) {}
		}
		
		try {
			toDate = dateFormat.parse(date2);
		} catch (Exception e) {
			try {
				toDate = dateFormat.parse("3000-12-31");
			} catch (ParseException e1) {}
		}
		
		String type = (String) searchParams.get("type");
		if(type == null)
			type = "level";
		
		return commonDao.getSerivcePage(pageNumber, pageSize, fromDate, toDate);
	}
	
	
}
