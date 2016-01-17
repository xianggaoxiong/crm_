package com.atuigu.crm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atguigu.ssps.modules.persistence.SearchFilter;
import com.atguigu.ssps.modules.persistence.SearchFilter.Operator;
import com.atuigu.crm.entity.Authority;

@Service
@Transactional
public class AuthorityService extends BaseService<Authority>{

	@Override
	protected Map<String, SearchFilter> buildSearchFilters() {
		Map<String, SearchFilter> filters = new HashMap<>();
		filters.put("parentAuthority", new SearchFilter("parentAuthority", Operator.NULL, null));
		
		return filters;
	}
	
	public List<Authority> getParentAuthorities(){
		Specification<Authority> specification = buildSpecification(null);
		return repository.findAll(specification); 
	}
	
}
