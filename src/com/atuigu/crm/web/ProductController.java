package com.atuigu.crm.web;

import javax.servlet.ServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atuigu.crm.entity.Product;

@Controller
@RequestMapping("/product")
public class ProductController extends BaseController<Product>{

	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(@RequestParam(value="id", defaultValue="-1") Long id, 
			RedirectAttributes attributes){
		return super.delete(id, attributes);
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String create(Product entity, RedirectAttributes attributes){
		return super.create(entity, attributes);
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET) 
	public String create(@RequestParam(value="id", defaultValue="-1") Long id,
			Model model) throws Exception{
		return super.create(id, model); 
	}
	
	@RequestMapping("/list")
	public String list(@RequestParam(value="page", defaultValue="1") int pageNumber,
			@RequestParam(value="page.size", defaultValue=RoleController.PAGE_SIZE) int pageSize, 
			Model model, ServletRequest request){
		return super.list(pageNumber, pageSize, model, request);
	}
	
}
