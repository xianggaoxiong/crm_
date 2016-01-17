package com.atuigu.crm.web;

import java.util.Date;

import javax.servlet.ServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atuigu.crm.entity.CustomerService;
import com.atuigu.crm.entity.User;
import com.atuigu.crm.service.DictService;
import com.atuigu.crm.service.ShiroDbRealm.ShiroUser;
import com.atuigu.crm.service.UserService;

@Controller
@RequestMapping("/service")
public class CustomerServiceController extends BaseController<CustomerService>{

	public static final ThreadLocal<String> states = new ThreadLocal<>();
	
	@Autowired
	private DictService dictService;
	
	@Autowired
	private com.atuigu.crm.service.CustomerService customerService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Long id, RedirectAttributes attributes){
		super.delete(id, attributes);
		return "redirect:/service/allot/list";
	}
	
	@RequestMapping(value="/archive", method=RequestMethod.GET)
	public String archive(@RequestParam("id") Long id, Model model){
		CustomerService cs = service.get(id);
		model.addAttribute("service", cs);
		return "/service/archive/archive";
	}
	
	@RequestMapping(value="/archive/list", method=RequestMethod.GET)
	public String archiveList(@RequestParam(value="page", defaultValue="1") int pageNumber,
			@RequestParam(value="page.size", defaultValue=RoleController.PAGE_SIZE) int pageSize, 
			Model model, ServletRequest request){
		states.set("已归档");
		model.addAttribute("users", userService.getAll());
		
		super.list(pageNumber, pageSize, model, request);
		return "/service/archive/list";
	}
	
	@RequestMapping(value="/feedback", method=RequestMethod.POST)
	public String feedback(@RequestParam("id") Long id, 
			@RequestParam("dealResult") String dealResult, 
			@RequestParam("satisfy") String satisfy,
			RedirectAttributes attributes){
		CustomerService cs = service.get(id);
		cs.setDealResult(dealResult);
		cs.setSatisfy(satisfy);
		cs.setServiceState("已归档");
		
		super.create(cs, attributes);
		
		return "redirect:/service/feedback/list";
	}
	
	@RequestMapping(value="/feedback", method=RequestMethod.GET)
	public String feedback(@RequestParam("id") Long id, Model model){
		CustomerService cs = service.get(id);
		model.addAttribute("service", cs);
		return "/service/feedback/feedback";
	}
	
	@RequestMapping("/feedback/list")
	public String feedbackList(@RequestParam(value="page", defaultValue="1") int pageNumber,
			@RequestParam(value="page.size", defaultValue=RoleController.PAGE_SIZE) int pageSize, 
			Model model, ServletRequest request){
		states.set("已处理");
		model.addAttribute("users", userService.getAll());
		
		super.list(pageNumber, pageSize, model, request);
		return "/service/feedback/list";
	}
	
	@RequestMapping(value="/deal", method=RequestMethod.POST)
	public String deal(@RequestParam("id") Long id, 
			@RequestParam("serviceDeal") String serviceDeal, RedirectAttributes attributes){
		CustomerService cs = service.get(id);
		
		cs.setServiceDeal(serviceDeal);
		cs.setDealDate(new Date());
		cs.setServiceState("已处理");
		
		super.create(cs, attributes);
		
		return "redirect:/service/deal/list";
	}
	
	@RequestMapping(value="/deal", method=RequestMethod.GET)
	public String deal(@RequestParam("id") Long id, Model model){
		CustomerService cs = service.get(id);
		model.addAttribute("service", cs);
		return "/service/deal/deal";
	}
	
	@RequestMapping(value="/deal/list", method=RequestMethod.GET)
	public String dealList(@RequestParam(value="page", defaultValue="1") int pageNumber,
			@RequestParam(value="page.size", defaultValue=RoleController.PAGE_SIZE) int pageSize, 
			Model model, ServletRequest request){
		states.set("已分配");
		model.addAttribute("users", userService.getAll());
		
		super.list(pageNumber, pageSize, model, request);
		return "/service/deal/list";
	}
	
	@RequestMapping("/allot")
	@ResponseBody
	public String allot(@RequestParam("id") Long id, @RequestParam("allotId") Long allotId){
		CustomerService cs = service.get(id);
		User user = new User();
		user.setId(allotId);
		cs.setAllotTo(user);
		cs.setAllotDate(new Date());
		cs.setServiceState("已分配"); 
		service.save(cs);
		
		return "1";
	}
	
	@RequestMapping(value="/allot/list")
	public String allotList(@RequestParam(value="page", defaultValue="1") int pageNumber,
			@RequestParam(value="page.size", defaultValue=RoleController.PAGE_SIZE) int pageSize, 
			Model model, ServletRequest request){
		states.set("新创建");
		model.addAttribute("users", userService.getAll());
		
		super.list(pageNumber, pageSize, model, request);
		return "/service/allot/list";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String create(CustomerService cs, RedirectAttributes attributes){
		ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		User user = new User(shiroUser.id);
		cs.setCreatedby(user);
		
		super.create(cs, attributes);
		
		return "redirect:/service/allot/list";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String create(Model model){
		model.addAttribute("serviceTypes", dictService.getServiceTypes());
		model.addAttribute("customers", customerService.getAll());
		
		return "/service/input";
	}
	
}
