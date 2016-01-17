package com.atuigu.crm.web;

import java.util.Date;

import javax.servlet.ServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atuigu.crm.entity.CustomerDrain;
import com.atuigu.crm.service.CustomerDrainService;

@Controller
@RequestMapping("/drain") 
public class CustomerDrainController extends BaseController<CustomerDrain>{
	
	@RequestMapping(value="/confirm", method=RequestMethod.POST)
	public String confirm(@RequestParam("id") Long id, @RequestParam("reason") String reason, 
			Model model, RedirectAttributes attributes){
		CustomerDrain customerDrain = service.get(id);
		customerDrain.setReason(reason);
		
		CustomerDrainService cds = (CustomerDrainService) service;
		cds.drain(customerDrain); 
		
		return super.create(customerDrain, attributes);
	}
	
	@RequestMapping(value="/confirm", method=RequestMethod.GET)
	public String confirm(@RequestParam("id") Long id, Model model){
		CustomerDrain customerDrain = service.get(id);
		model.addAttribute("drain", customerDrain);
		service.save(customerDrain);
		
		return "/drain/confirm";
	}
	
	@RequestMapping(value="/delay", method=RequestMethod.POST)
	public String delay(@RequestParam("id") Long id, @RequestParam("delay") String delay, 
			Model model, RedirectAttributes attributes){
		CustomerDrain customerDrain = service.get(id);
		
		if(customerDrain.getDelay() == null){
			customerDrain.setDelay(delay);			
		}else{
			customerDrain.setDelay(customerDrain.getDelay() + "`" + delay);						
		}
		
		super.create(customerDrain, attributes);
		model.addAttribute("drain", customerDrain);
		
		return "redirect:/drain/delay?id=" + id;
	}
	
	@RequestMapping(value="/delay", method=RequestMethod.GET)
	public String delay(@RequestParam("id") Long id, Model model){
		CustomerDrain customerDrain = service.get(id);
		model.addAttribute("drain", customerDrain);
		service.save(customerDrain);
		
		return "/drain/delay";
	}
	
	@RequestMapping("/list")
	public String list(@RequestParam(value="page", defaultValue="1") int pageNumber,
			@RequestParam(value="page.size", defaultValue=RoleController.PAGE_SIZE) int pageSize, 
			Model model, ServletRequest request){
		return super.list(pageNumber, pageSize, model, request);
	}
	
}
