package com.atuigu.crm.web;

import java.util.Map;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.atguigu.ssps.quickstart.modules.web.Servlets;
import com.atuigu.crm.service.CustomerDrainService;
import com.atuigu.crm.service.CustomerService;

@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CustomerDrainService drainService;
	
	@RequestMapping("/drain")
	public String list(@RequestParam(value="page", defaultValue="1") int pageNumber,
			@RequestParam(value="page.size", defaultValue=RoleController.PAGE_SIZE) int pageSize, 
			Model model, ServletRequest request){
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		model.addAttribute("page", drainService.getPage(searchParams, pageNumber, pageSize));  
		
		//将搜索条件编码成字符串, 用于排序, 分页的 URL
		model.addAttribute("searchParams", 
				Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		
		return "/report/drain";
	}
	
	@RequestMapping("/service")
	public String service(@RequestParam(value="page", defaultValue="1") int pageNumber,
			@RequestParam(value="page.size", defaultValue=RoleController.PAGE_SIZE) int pageSize, 
			Model model, ServletRequest request){
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		model.addAttribute("page", customerService.getConsistPage(searchParams, pageNumber, pageSize));  
		
		//将搜索条件编码成字符串, 用于排序, 分页的 URL
		model.addAttribute("searchParams", 
				Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		
		return "/report/service";
	}
	
	@RequestMapping("/consist")
	public String consist(@RequestParam(value="page", defaultValue="1") int pageNumber,
			@RequestParam(value="page.size", defaultValue=RoleController.PAGE_SIZE) int pageSize, 
			Model model, ServletRequest request){
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		model.addAttribute("page", customerService.getConsistPage(searchParams, pageNumber, pageSize));  

		//将搜索条件编码成字符串, 用于排序, 分页的 URL
		model.addAttribute("searchParams", 
				Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		
		return "/report/consist";
	}
	
	@RequestMapping("/pay")
	public String pay(@RequestParam(value="page", defaultValue="1") int pageNumber,
			@RequestParam(value="page.size", defaultValue=RoleController.PAGE_SIZE) int pageSize, 
			Model model, ServletRequest request){
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		model.addAttribute("page", customerService.getCustomerPage(searchParams, pageNumber, pageSize));  

		//将搜索条件编码成字符串, 用于排序, 分页的 URL
		model.addAttribute("searchParams", 
				Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		
		return "/report/pay";
	}
	
}
