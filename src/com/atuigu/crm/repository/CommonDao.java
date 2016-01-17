package com.atuigu.crm.repository;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.atuigu.crm.entity.Customer;

@Repository
public class CommonDao {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Transactional
	public void executeProcedure(){
		System.out.print("开始-->");
		Query query = entityManager.createNativeQuery("{call check_drain()}");
		query.executeUpdate();
		System.out.println("<--结束");
	}
	
	public Page<Customer> getCustomerPage(int pageNo, int pageSize, 
			String custName, Date fromDate, Date toDate){
		String jpql = "SELECT count(DISTINCT c.id) FROM Customer c "
				+ "INNER JOIN c.orders o "
				+ "WHERE c.name LIKE ? AND o.date BETWEEN ? AND ?";
		Query query = entityManager.createQuery(jpql);
		query.setParameter(1, custName)
		     .setParameter(2, fromDate)
		     .setParameter(3, toDate);
		
		long count = (Long) query.getSingleResult();
		
		jpql = "SELECT DISTINCT c FROM Customer c "
				+ "INNER JOIN c.orders o "
				+ "WHERE c.name LIKE ? AND o.date BETWEEN ? AND ?";
		query = entityManager.createQuery(jpql);
		
		List<Customer> customerList = 
			query.setParameter(1, custName)
			     .setParameter(2, fromDate)
			     .setParameter(3, toDate)
			     .setFirstResult((pageNo - 1) * pageSize)
			     .setMaxResults(pageSize)
			     .getResultList();
		
		PageRequest pageRequest = new PageRequest(pageNo - 1, pageSize);
		
		return new PageImpl<>(customerList, pageRequest, count);
	}

	public Page<Object[]> getConsistPage(int pageNumber, int pageSize, String type) {
		String jpql = "SELECT count(c." + type + ") FROM Customer c "
				+ "WHERE c." + type + " IS NOT NULL "
				+ "GROUP BY c." + type;
		
		int count = entityManager.createQuery(jpql).getResultList().size();
		
		jpql = "SELECT " + type + ", count(c.id) FROM Customer c "
				+ "WHERE c." + type + " IS NOT NULL "
				+ "GROUP BY c." + type;
		List<Object[]> result = entityManager.createQuery(jpql)
			                                 .setFirstResult((pageNumber - 1))
				                             .setMaxResults(pageSize)
				                             .getResultList();
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize);
		return new PageImpl<>(result, pageRequest, count);
	}
	
	public Page<Object[]> getSerivcePage(int pageNumber, int pageSize, 
			Date fromDate, Date toDate){
		String jpql = "SELECT count(cs.serviceType) FROM CustomerService cs "
				+ "WHERE cs.customer IS NOT NULL AND cs.createDate BETWEEN ? AND ? "
				+ "GROUP BY cs.serviceType";
		
		int count = entityManager.createQuery(jpql)
				                 .setParameter(1, fromDate)
			                     .setParameter(2, toDate)
				                 .getResultList().size();
		
		jpql = "SELECT count(cs.serviceType), cs.serviceType  FROM CustomerService cs "
				+ "WHERE cs.customer IS NOT NULL AND cs.createDate BETWEEN ? AND ? "
				+ "GROUP BY cs.serviceType";
		List<Object[]> result = entityManager.createQuery(jpql)
											 .setParameter(1, fromDate)
								             .setParameter(2, toDate)
			                                 .setFirstResult((pageNumber - 1))
				                             .setMaxResults(pageSize)
				                             .getResultList();
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize);
		return new PageImpl<>(result, pageRequest, count);
	}
}
