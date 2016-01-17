package com.atuigu.crm.web;

import java.util.Map;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atguigu.ssps.quickstart.modules.web.Servlets;
import com.atuigu.crm.entity.SalesPlan;
import com.atuigu.crm.service.SalesChanceService;
import com.atuigu.crm.service.SalesPlanService;

@Controller
@RequestMapping("/plan")
public class SalesPlanCotroller {
	
	@Autowired
	private SalesPlanService planService;
	@Autowired
	private SalesChanceService chanceService;
	
	@RequestMapping("/execute")
	public String execute(@RequestParam("id") Long id, @RequestParam("result") String result, 
			Model model){
		SalesPlan plan = planService.get(id);
		plan.setResult(result);
		planService.save(plan);
		model.addAttribute("chance", plan.getChance());  
		return "/plan/exec";
	}
	
	@RequestMapping(value="/execution", method=RequestMethod.GET)
	public String execute(@RequestParam("id") Long id, 
			Model model){
		model.addAttribute("chance", chanceService.get(id)); 
		return "/plan/exec";
	}
	
	@RequestMapping("/make-ajax")
	@ResponseBody
	public String make(@RequestParam("id") Long id, 
			@RequestParam("todo") String todo){
		SalesPlan plan = planService.get(id);
		plan.setTodo(todo);
		planService.save(plan);
		return "1";
	}

	@RequestMapping("/delete-ajax")
	@ResponseBody
	public String delete(@RequestParam("id") Long id){
		planService.delete(id); 
		return "1";
	}
	
	@RequestMapping(value="/make", method=RequestMethod.POST)
	public String make(SalesPlan plan, RedirectAttributes attributes){
		planService.save(plan);
		attributes.addFlashAttribute("message", "新建计划成功");
		return "redirect:/plan/make?id=" + plan.getChance().getId();
	}

	@RequestMapping(value="/make", method=RequestMethod.GET)
	public String make(@RequestParam("id") Long id, Model model){
		model.addAttribute("chance", chanceService.get(id)); 
		return "/plan/make";
	}
	
	@RequestMapping("/list")
	public String list(@RequestParam(value="page", defaultValue="1") int pageNo, 
			Model model, ServletRequest request){
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		model.addAttribute("page", chanceService.getSalesChancePage(searchParams, pageNo, 5)); 
		
		//将搜索条件编码成字符串, 用于排序, 分页的 URL
		model.addAttribute("searchParams", 
				Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));;
		
		return "/plan/list";
	}
	
}
