package com.atuigu.crm.web;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atuigu.crm.entity.Customer;
import com.atuigu.crm.entity.CustomerActivity;
import com.atuigu.crm.service.CustomerService;

@Controller
@RequestMapping("/activity")
public class CustomerActivityController extends BaseController<CustomerActivity>{

	@Autowired
	private CustomerService customerService;
	
	public static final ThreadLocal<Customer> customers = new ThreadLocal<>();
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(@RequestParam(value="id", defaultValue="-1") Long id, 
			@RequestParam(value="customerid", defaultValue="-1") Long customerId,
			RedirectAttributes attributes){
		return super.delete(id, attributes) + "?customerid=" + customerId; 
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String create(@RequestParam(value="customer.id", defaultValue="-1") Long customerId, 
			CustomerActivity entity, RedirectAttributes attributes){
		return super.create(entity, attributes) + "?customerid=" + customerId;
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET) 
	public String create(@RequestParam(value="id", defaultValue="-1") Long id,
			Model model) throws Exception{
		return super.create(id, model); 
	}
	
	@RequestMapping("/list")
	public String list(@RequestParam(value="page", defaultValue="1") int pageNumber,
			@RequestParam(value="page.size", defaultValue=RoleController.PAGE_SIZE) int pageSize, 
			@RequestParam(value="customerid") Long customerId,
			Model model, ServletRequest request){
		Customer customer = customerService.get(customerId);
		model.addAttribute("customer", customer);
		customers.set(customer);
		
		return super.list(pageNumber, pageSize, model, request);
	}
	
}
