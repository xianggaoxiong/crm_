package com.atuigu.crm.web;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.atuigu.crm.entity.Customer;
import com.atuigu.crm.entity.Order;
import com.atuigu.crm.service.CustomerService;

@Controller
@RequestMapping("/order")
public class OrderController extends BaseController<Order>{

	@Autowired
	private CustomerService customerService;
	
	public static final ThreadLocal<Customer> customers = new ThreadLocal<>();
	
	@RequestMapping("/details")
	public String details(@RequestParam(value="id") Long id, 
			Model model){
		model.addAttribute("order", service.get(id));
		return "/order/details";
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
