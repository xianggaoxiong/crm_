package com.atuigu.crm.web;

import java.util.Map;

import javax.servlet.ServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atguigu.ssps.quickstart.modules.web.Servlets;
import com.atuigu.crm.entity.SalesChance;
import com.atuigu.crm.entity.User;
import com.atuigu.crm.service.SalesChanceService;
import com.atuigu.crm.service.UserService;
import com.atuigu.crm.service.ShiroDbRealm.ShiroUser;

@Controller
@RequestMapping("/chance")
public class SalesChanceController {

	@Autowired
	private SalesChanceService salesChanceService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/finish")
	public String finish(@RequestParam("id") Long id, 
			RedirectAttributes attributes){
		salesChanceService.finish(id);
		attributes.addFlashAttribute("message", "完成开发成功!");
		return "redirect:/plan/list";
	}
	
	@RequestMapping("/detail")
	public String detail(@RequestParam("id") Long id, 
			Model model){ 
		model.addAttribute("chance", salesChanceService.get(id));
		return "/plan/detail";
	}
	
	@RequestMapping("/stop")
	public String stop(@RequestParam("id") Long id, 
			RedirectAttributes attributes){
		salesChanceService.stop(id);
		attributes.addFlashAttribute("message", "终止开发成功!");
		return "redirect:/plan/list";
	}
	
	@ModelAttribute
	public void getChance(@RequestParam(value="id", defaultValue="-1") Long id, 
			@RequestParam(value="designee.id", defaultValue="-1") Long userId, Model model){
		if(id != -1){
			SalesChance chance = salesChanceService.get(id);
			
			if(userId != -1){
				chance.setDesignee(null); 
			}
			
			model.addAttribute("chance", chance); 
		}
	}
	
	@RequestMapping(value="/dispatch", method=RequestMethod.POST)
	public String dispatch(@ModelAttribute("chance") SalesChance chance, 
			RedirectAttributes attributes){
		//状态转为: 执行中. 
		chance.setStatus(2);
		salesChanceService.save(chance); 
		return "redirect:/chance/list";
	}
	
	@RequestMapping(value="/dispatch", method=RequestMethod.GET)
	public String dispatch(@RequestParam("id") Long id, Model model){
		SalesChance salesChance = salesChanceService.get(id);
		model.addAttribute("chance", salesChance);
		model.addAttribute("users", userService.getAll());
		return "chance/dispatch";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Long id){
		salesChanceService.delete(id); 
		return "redirect:/chance/list";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String create(@ModelAttribute("chance") SalesChance chance, Model model, RedirectAttributes attributes){
		
		ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		User user = new User(shiroUser.id);
		chance.setCreateBy(user);
		chance.setStatus(1); 
		
		salesChanceService.save(chance);
		
		if(chance.getId() == null)
			attributes.addFlashAttribute("message", "新建销售机会成功");
		else
			attributes.addFlashAttribute("message", "修改销售机会成功");
		
		return "redirect:/chance/list";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String create(@RequestParam(value="id", defaultValue="-1") Long id ,Model model){
		if(id != -1){
			model.addAttribute("chance", salesChanceService.get(id));
		}else{
			model.addAttribute("chance", new SalesChance());
		}
		
		return "chance/input";
	}
	
	@RequestMapping("/list")
	public String list(@RequestParam(value="page", defaultValue="1") int pageNo, 
			Model model, ServletRequest request){
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		model.addAttribute("page", salesChanceService.getPage(searchParams, pageNo, 5)); 
		
		//将搜索条件编码成字符串, 用于排序, 分页的 URL
		model.addAttribute("searchParams", 
				Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));;
		
		return "/chance/list";
	}
	
}
