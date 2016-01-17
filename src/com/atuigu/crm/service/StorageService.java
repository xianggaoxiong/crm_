package com.atuigu.crm.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atguigu.ssps.modules.persistence.DynamicSpecifications;
import com.atguigu.ssps.modules.persistence.SearchFilter;
import com.atuigu.crm.entity.Storage;
import com.atuigu.crm.repository.StorageRepository;

@Transactional
@Service
public class StorageService extends BaseService<Storage>{

	
}
