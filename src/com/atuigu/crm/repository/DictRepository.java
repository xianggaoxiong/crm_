package com.atuigu.crm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.atuigu.crm.entity.Dict;

public interface DictRepository extends BaseRepository<Dict>{

	@Query("SELECT item FROM Dict d WHERE d.type = '地区'")
	List<String> getRegions();
	
	@Query("SELECT item FROM Dict d WHERE d.type = '客户等级'")
	List<String> getLevels();
	
	@Query("SELECT item FROM Dict d WHERE d.type = '满意度'")
	List<String> getSatifies();
	
	@Query("SELECT item FROM Dict d WHERE d.type = '信用度'")
	List<String> getCredits();
	
	@Query("SELECT item FROM Dict d WHERE d.type = '服务类型'")
	List<String> getServiceTypes();
	
}
