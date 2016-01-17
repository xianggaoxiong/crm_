package com.atuigu.crm.web;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atguigu.ssps.quickstart.modules.web.Servlets;
import com.atuigu.crm.entity.Authority;
import com.atuigu.crm.entity.Role;
import com.atuigu.crm.service.AuthorityService;
import com.atuigu.crm.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {

	public static final String PAGE_SIZE = "5";
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private AuthorityService authorityService;
	
	@ModelAttribute
	public void getRole(@RequestParam(value="id", defaultValue="-1") Long id, 
			Model model){
		if(id != -1){
			model.addAttribute("role", roleService.get(id)); 
		}
	}
	
	/**
	 * 不自动绑定对象中的 authorities 属性. 必须添加!
	 */
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setDisallowedFields("authorities");
	}
	
	@RequestMapping(value="/assign", method=RequestMethod.POST)
	public String assign(@ModelAttribute("role") Role role, 
			@RequestParam(value="authorities", defaultValue="-1") List<Long> authorities,
			RedirectAttributes attributes){
		/*
		role.getAuthorities().clear();
		
		if(!authorities.contains(-1L)){
			for(Long id: authorities){
				Authority authority = new Authority(id);
				role.getAuthorities().add(authority);
			}			
		}
		*/
		roleService.save(role); 
		attributes.addFlashAttribute("message", "设置角色成功!");
		
		return "redirect:/role/list";
	}
	
	@RequestMapping(value="/assign/{id}", method=RequestMethod.GET)
	public String assignForm(@PathVariable("id") Long id,Model model, ServletRequest request){
		
		model.addAttribute("role", roleService.get(id));
		model.addAttribute("parentAuthorities", authorityService.getParentAuthorities());
		
		return "/role/assign";
	}
	
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes attributes){
		roleService.delete(id);
		attributes.addFlashAttribute("message", "删除角色成功");
		return "redirect:/role/list";
	}
	
	@RequestMapping("/create")
	public String create(@Valid Role role, RedirectAttributes attributes){
		roleService.save(role);
		attributes.addFlashAttribute("message", "创建角色成功");
		return "redirect:/role/list";
	}
	
	@RequestMapping("/list")
	public String list(@RequestParam(value="page", defaultValue="1") int pageNumber,
			@RequestParam(value="page.size", defaultValue=PAGE_SIZE) int pageSize,
			Model model, ServletRequest request){
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		
		model.addAttribute("page", roleService.getPage(searchParams, pageNumber, pageSize)); 
		return "role/list";
	}
	
}
