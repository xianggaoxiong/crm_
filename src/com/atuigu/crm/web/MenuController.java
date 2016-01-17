package com.atuigu.crm.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import net.sf.navigator.menu.MenuComponent;
import net.sf.navigator.menu.MenuRepository;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atuigu.crm.entity.Authority;
import com.atuigu.crm.entity.User;
import com.atuigu.crm.service.ShiroDbRealm.ShiroUser;
import com.atuigu.crm.service.UserService;

@Controller
public class MenuController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/menu")
	public String menuList(HttpServletRequest request){
		
		ServletContext servletContext = request.getSession().getServletContext();
		String contextPath = servletContext.getContextPath();
		
		MenuRepository repository = new MenuRepository();
		MenuRepository defaultRepository = 
				(MenuRepository) servletContext.getAttribute(MenuRepository.MENU_REPOSITORY_KEY);
		repository.setDisplayers(defaultRepository.getDisplayers());
		
		//1. 创建一个顶级按钮: "教育办公管理系统"
		MenuComponent topMenu = new MenuComponent();
		topMenu.setName("TOP-MENU");
		topMenu.setTitle("客户关系管理系统");
		repository.addMenu(topMenu);
		
		//3. 添加权限相关的 Menu
		//3.1 获取用户的信息
		
		ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		User user = userService.findUserByLoginName(shiroUser.name);
		
		//3.2 获取用户的所有的角色, 进而获取该用户有的所有的权限
		List<Authority> authorities = user.getRole().getAuthorities();
		
		Map<Authority, MenuComponent> parentMenus = new HashMap<Authority, MenuComponent>();
		
		for(Authority authority: authorities){
			MenuComponent menu = new MenuComponent();
			menu.setName(authority.getName());
			menu.setTitle(authority.getDisplayName());
			menu.setImage(contextPath + "/images/arrow-right.gif");
			menu.setLocation(contextPath + authority.getUrl());
			menu.setTarget("content");
			
			MenuComponent parentMenu = parentMenus.get(authority.getParentAuthority());
			
			if(parentMenu == null){
				parentMenu = new MenuComponent();
				parentMenu.setName(authority.getParentAuthority().getName());
				parentMenu.setTitle(authority.getParentAuthority().getDisplayName());
				
				parentMenu.setParent(topMenu);
				parentMenus.put(authority.getParentAuthority(), parentMenu);
			}
			
			menu.setParent(parentMenu);
		}
		
		request.getSession().setAttribute("repository2", repository);
		return "/home/menu";
	}
	
}
