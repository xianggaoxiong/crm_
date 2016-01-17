package com.atuigu.crm.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;

import com.atguigu.ssps.modules.persistence.DynamicSpecifications;
import com.atguigu.ssps.modules.persistence.SearchFilter;
import com.atuigu.crm.repository.BaseRepository;

public class BaseService<T> {

	@Autowired
	protected BaseRepository<T> repository;
	
	public Iterable<T> getAll(){
		return repository.findAll();
	}
	
	public void delete(Long id){
		repository.delete(id);
	}
	
	public T get(Long id){
		return repository.findOne(id);
	}
	
	public void save(T entity){
		repository.save(entity);
	}
	
	/**
	 * 创建动态查询条件组合
	 */
	protected Specification<T> buildSpecification(Map<String, Object> searchParams){
		
		Map<String, SearchFilter> filters = null;

		if(searchParams == null){
			filters = new HashMap<String, SearchFilter>();
		}else{
			filters = SearchFilter.parse(searchParams);
		}
		
		Map<String, SearchFilter> map = buildSearchFilters();
		if(map != null){
			filters.putAll(map); 
		}
		
		Specification<T> specification = null;
		specification =	DynamicSpecifications.bySearchFilter(filters.values());
		return specification;
	}
	
	protected Map<String, SearchFilter> buildSearchFilters(){
		return null;
	}
	
	public Page<T> getPage(Map<String, Object> searchParams, 
			int pageNumber, int pageSize){
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize);
		Specification<T> specification = buildSpecification(searchParams);
		Page<T> page = repository.findAll(specification, pageRequest); 
		
		return page; 
	}
	
}
