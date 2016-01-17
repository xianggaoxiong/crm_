package com.atuigu.crm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.atuigu.crm.entity.Contact;
import com.atuigu.crm.entity.Customer;

public interface ContactRepository extends BaseRepository<Contact>{

	public List<Contact> getContactByCustomer(Customer customer);

}
