package com.atuigu.crm.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atuigu.crm.entity.Dict;
import com.atuigu.crm.repository.DictRepository;

@Transactional
@Service
public class DictService extends BaseService<Dict>{

	public DictService() {
		System.out.println("------>" + this);
	}
	
	public List<String> getServiceTypes(){
		DictRepository dictRepository = (DictRepository) repository;
		return dictRepository.getServiceTypes();
	}

	public List<String> getRegions(){
		DictRepository dictRepository = (DictRepository) repository;
		return dictRepository.getRegions();
	}
	
	public List<String> getCredits(){
		DictRepository dictRepository = (DictRepository) repository;
		return dictRepository.getCredits();
	}
	
	public List<String> getLevels(){
		DictRepository dictRepository = (DictRepository) repository;
		return dictRepository.getLevels();
	}
	
	public List<String> getSatisfies(){
		DictRepository dictRepository = (DictRepository) repository;
		return dictRepository.getSatifies();
	}
	
}
