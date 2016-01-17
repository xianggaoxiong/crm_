package com.atuigu.crm.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface BaseRepository<T> extends PagingAndSortingRepository<T, Long>,
	JpaSpecificationExecutor<T> {

}