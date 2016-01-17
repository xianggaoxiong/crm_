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
import com.atuigu.crm.service.ContactService;
import com.atuigu.crm.service.DictService;

@Controller
@RequestMapping("/customer")
public class CustomerController extends BaseController<Customer>{

	@Autowired
	private DictService dictService;
	@Autowired
	private ContactService contactService;
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(@RequestParam(value="id", defaultValue="-1") Long id, 
			RedirectAttributes attributes, Model model){
		model.addAttribute("regions", dictService.getRegions());
		model.addAttribute("levels", dictService.getLevels());
		
		Customer customer = service.get(id);
		customer.setState("删除");
		service.save(customer);
		
		return "redirect:/customer/list";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String create(Customer entity, RedirectAttributes attributes, 
			Model model){
		model.addAttribute("regions", dictService.getRegions());
		model.addAttribute("levels", dictService.getLevels());
		
		return super.create(entity, attributes);
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET) 
	public String create(@RequestParam(value="id", defaultValue="-1") Long id,
			Model model) throws Exception{
		model.addAttribute("regions", dictService.getRegions());
		model.addAttribute("levels", dictService.getLevels());
		model.addAttribute("satisfies", dictService.getSatisfies());
		model.addAttribute("credits", dictService.getCredits());
		model.addAttribute("managers", contactService.getManagersByCustomer(id)); 
		
		return super.create(id, model); 
	}
	
	@RequestMapping("/list")
	public String list(@RequestParam(value="page", defaultValue="1") int pageNumber,
			@RequestParam(value="page.size", defaultValue=RoleController.PAGE_SIZE) int pageSize, 
			Model model, ServletRequest request){
		model.addAttribute("regions", dictService.getRegions());
		model.addAttribute("levels", dictService.getLevels());
		
		return super.list(pageNumber, pageSize, model, request);
	}
	
}
