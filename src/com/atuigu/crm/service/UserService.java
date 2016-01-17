package com.atuigu.crm.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atguigu.ssps.modules.security.utils.Digests;
import com.atguigu.ssps.utils.Encodes;
import com.atuigu.crm.entity.User;
import com.atuigu.crm.repository.UserRepository;

@Service
@Transactional
public class UserService extends BaseService<User>{

	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8;
	
	public User findUserByLoginName(String username) {
		return ((UserRepository)repository).getUserByName(username); 
	}
	
	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	private void entryptPassword(User user) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		byte[] hashPassword = Digests.sha1(user.getPassword().getBytes(), salt, HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}
	
	public void save(User user){
		entryptPassword(user); 
		super.save(user);
	}
	
	public static void main(String[] args) {
		User user = new User();
		
		String password = "123456";
		
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));
		System.out.println("salt: " + user.getSalt());
		
		byte[] hashPassword = Digests.sha1(password.getBytes(), salt, HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));
		
		System.out.println("password: " + user.getPassword());
	}

}
