package com.atuigu.crm.web;

import java.util.Map;

import javax.servlet.ServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atguigu.ssps.quickstart.modules.web.Servlets;
import com.atguigu.ssps.utils.Reflections;
import com.atuigu.crm.service.BaseService;

public class BaseController<T>{

	private Class<T> entityClass;
	
	private String lowerClassName; 
	
	@Autowired
	protected BaseService<T> service;
	
	public BaseController() {
		entityClass = Reflections.getClassGenricType(getClass());
		String className = entityClass.getSimpleName();
		lowerClassName = getDirName(className);
	}
	
	private static String getDirName(String className) {
		String str = StringUtils.reverse(className);
		
		int index = 0;
		
		for(int i = 0; i < str.length(); i++){
			char c = str.charAt(i);
			
			if(c >= 'A' && c <= 'Z'){
				index = i;
				break;
			}
		}
		
		if(index != 0){
			index = str.length() - index - 1;
		}

		className = className.substring(index);	
		return className.toLowerCase();
	}
	
	public String delete(Long id, RedirectAttributes attributes){
		if(id != -1){
			service.delete(id); 
			attributes.addFlashAttribute("message", "删除成功!");
		}
		return "redirect:/" + lowerClassName + "/list";
	}
	
	public String create(T entity, RedirectAttributes attributes){
		service.save(entity);
		attributes.addFlashAttribute("message", "保存成功!");
		return "redirect:/" + lowerClassName + "/list";
	}
	
	public String create(Long id, Model model) throws Exception{
		if(id == -1){
			model.addAttribute(lowerClassName, entityClass.newInstance()); 
		}else{
			model.addAttribute(lowerClassName, service.get(id)); 
		}
		
		return "/" + lowerClassName + "/input";
	}
	
	public String list(int pageNumber, int pageSize, Model model, ServletRequest request){
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		
		model.addAttribute("page", service.getPage(searchParams, pageNumber, pageSize)); 

		//将搜索条件编码成字符串, 用于排序, 分页的 URL
		model.addAttribute("searchParams", 
				Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
						
		return "/" + lowerClassName + "/list";
	}
}
