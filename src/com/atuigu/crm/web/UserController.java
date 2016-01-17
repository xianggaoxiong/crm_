package com.atuigu.crm.web;

import java.util.Map;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atguigu.ssps.quickstart.modules.web.Servlets;
import com.atuigu.crm.entity.User;
import com.atuigu.crm.service.RoleService;
import com.atuigu.crm.service.UserService;
import com.google.common.collect.Maps;

@Controller
@RequestMapping("/user")
public class UserController {

	private static Map<Integer, String> allStatus = Maps.newHashMap();
	
	static{
		allStatus.put(1, "有效");
		allStatus.put(0, "无效");
	}
	
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("/login")
	public String login(){
		return "";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Long id, RedirectAttributes attributes){
		userService.delete(id); 
		attributes.addFlashAttribute("message", "删除用户成功");
		return "redirect:/user/list";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String create(User user, Model model, RedirectAttributes attributes){
		userService.save(user);
		
		if(user.getId() == null)
			attributes.addFlashAttribute("message", "新建用户成功");
		else
			attributes.addFlashAttribute("message", "修改用户成功");
			
		return "redirect:/user/list";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String create(@RequestParam(value="id", defaultValue="-1") Long id,
			Model model){
		model.addAttribute("allStatus", allStatus);
		model.addAttribute("roles", roleService.getAll()); 
		User user = null;
		if(id != -1){
			user = userService.get(id);
		}else{
			user = new User();
		}
		
		model.addAttribute("user", user);
		return "user/input";
	}
	
	@RequestMapping("/list")
	public String list(@RequestParam(value="page", defaultValue="1") int pageNo, Model model, ServletRequest request){
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		model.addAttribute("page", userService.getPage(searchParams, pageNo, 5));
		
		//将搜索条件编码成字符串, 用于排序, 分页的 URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));;
		
		return "user/list";
	}
	
}
