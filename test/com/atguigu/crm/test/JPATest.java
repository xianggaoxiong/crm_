package com.atguigu.crm.test;

import java.util.Date;
import java.util.UUID;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.atuigu.crm.repository.CommonDao;

public class JPATest {

	@Test
	public void testUUID(){
		System.out.println(UUID.randomUUID().toString());
	}
	
	@Test
	public void testConsist(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		CommonDao commonDao = ctx.getBean(CommonDao.class);
//		commonDao.getConsistPage(1, 5, "satify");
		
		commonDao.getSerivcePage(1, 5, new Date(), new Date());
	}
	
	@Test
	public void testSpecification(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		CommonDao commonDao = ctx.getBean(CommonDao.class);
		commonDao.getCustomerPage(1, 2, "a", new Date(), new Date());
	}
	
	@Test
	public void test() throws InterruptedException {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-quartz.xml");
		
//		UserService userService = (UserService) ctx.getBean("userService");
		
//		User user = new User();
//		user.setEnabled(1);
//		user.setName("abcd");
//		user.setPassword("123456");
//		userService.save(user);
		
//		User user = userService.findUserByLoginName("a");
//		System.out.println(user); 
		
		Thread.sleep(1000 * 100);
	}

}
