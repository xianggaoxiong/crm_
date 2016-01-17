package com.atuigu.crm.repository;

import com.atuigu.crm.entity.User;

public interface UserRepository extends BaseRepository<User>{

	User getUserByName(String name);
	
}
