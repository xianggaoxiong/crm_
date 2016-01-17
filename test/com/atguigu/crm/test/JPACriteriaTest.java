package com.atguigu.crm.test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;

import com.atuigu.crm.entity.Customer;
import com.atuigu.crm.entity.User;
import com.atuigu.crm.repository.CustomerRepository;
import com.atuigu.crm.service.UserService;

public class JPACriteriaTest {

	private ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	private EntityManagerFactory entityManagerFactory = ctx.getBean(EntityManagerFactory.class);
	
	@Test
	public void test3() throws ParseException{
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Customer> criteriaQuery = criteriaBuilder.createQuery(Customer.class);
		Root<Customer> root = criteriaQuery.from(Customer.class);
		
		Path orders = root.join("orders").get("date");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		final Date date1 = dateFormat.parse("1790-12-12");
		final Date date2 = dateFormat.parse("2015-12-12");
		
//		Predicate predicate1 = criteriaBuilder.between(orders, date1, date2);
		Predicate predicate1 = criteriaBuilder.greaterThan(orders, date1);
		Predicate predicate2 = criteriaBuilder.lessThan(orders, date2);
		final Predicate predicate = criteriaBuilder.and(predicate1, predicate2);
		criteriaQuery.where(predicate);
		
		//TypedQuery: 用于执行 JPA Criteria 查询
		TypedQuery<Customer> typedQuery = entityManager.createQuery(criteriaQuery);
		
		//查询
		List<Customer> customers = typedQuery.getResultList();
		customers = new ArrayList<>(new LinkedHashSet<>(customers));
		for(Customer cust: customers){
			System.out.println("-->" + cust.getName());
		}
		
		CustomerRepository customerRepository = ctx.getBean(CustomerRepository.class);
		PageRequest pageable = new PageRequest(1, 5);
		Specification<Customer> specification = new Specification<Customer>() {
			@Override
			public Predicate toPredicate(Root<Customer> arg0,
					CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				Path orders = arg0.join("orders").get("date");
				
				Predicate predicate1 = arg2.greaterThan(orders, date1);
				Predicate predicate2 = arg2.lessThan(orders, date2);
				Predicate predicate = arg2.and(predicate1, predicate2);
				
				arg1.distinct(true);
				
				return predicate;
			}
		};
		
		Page<Customer> page = customerRepository.findAll(specification, pageable);
		System.out.println(page.getTotalElements());
		System.out.println(page.getTotalPages());
	}
	
	@Test
	public void changeUserPassword(){
		UserService userService = ctx.getBean(UserService.class);
		
		User user = userService.get(21L);
		user.setPassword("123456");
		
		userService.save(user);
	}
	
	@Test
	public void test2(){
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		//JPA Criteria 查询
		//CriteriaBuilder: JPA Criteria 查询的工厂类, 用于创建查询条件, 还用于创建 CriteriaQuery 对象
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		
		//CriteriaQuery
		//1. 该对象并非用于执行 JPA Criteria 查询
		//2. 该对象用于添加查询条件, 和指定从哪个对象中开始进行查询
		CriteriaQuery<User> criteriaQuery = criteriaBuilder.createQuery(User.class);
		
		//Root
		//指定查询哪一个对象
		Root<User> root = criteriaQuery.from(User.class);
		
		//添加查询条件
		//Predicate 代表查询条件. 该对象可以由 CriteriaBuilder 来创建
		//创建 Predicate 时, 需要指定和哪一个属性进行匹配, 用 Expression 对象来封装
		//而 Expression 对象由 Root 来导航
		Expression<User> expression = root.get("name");
		Predicate predicate = criteriaBuilder.equal(expression, "abc");
		
		//TypedQuery: 用于执行 JPA Criteria 查询
		TypedQuery<User> typedQuery = entityManager.createQuery(criteriaQuery);
		
		//查询
		typedQuery.getResultList();
	}
	
	@Test
	public void test() {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		//JPA Criteria 查询的工厂类
		//用于构建 CriteriaQuery 和代表查询条件的 Predicate 对象
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		
		//JPA Criteria 查询对象, 用于设置对哪个类进行查询, 查询时需要添加哪些查询条件
		CriteriaQuery<User> criteriaQuery = criteriaBuilder.createQuery(User.class);
	
		//设置要查询的实体类
		Root<User> root = criteriaQuery.from(User.class);
		
		//添加查询条件
		Expression expression = root.get("id");
		Predicate predicate = criteriaBuilder.greaterThan(expression, 1);
		criteriaQuery.where(predicate);
		
		//查询
		TypedQuery<User> typedQuery = entityManager.createQuery(criteriaQuery);
		List<User> users = typedQuery.getResultList();
		
		System.out.println(users.size());
	}

}
