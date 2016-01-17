package com.atuigu.crm.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Table(name="CUSTOMER_SERVICES")
@Entity
public class CustomerService extends IdEntity {

	// 服务类型
	private String serviceType;
	// 服务概要
	private String serviceTitle;

	// 服务客户
	private Customer customer;
	// 服务状态
	private String serviceState;

	// 服务请求
	private String serviceRequest;

	// 服务创建人
	private User createdby;
	// 服务创建时间
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createDate;

	// 分配人
	private User allotTo;
	// 分配时间
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date allotDate;

	// 服务处理
	private String serviceDeal;
	// 处理时间
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date dealDate;

	// 处理结果
	private String dealResult;
	// 客户满意度
	private String satisfy;

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public String getServiceTitle() {
		return serviceTitle;
	}

	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}

	@ManyToOne
	@JoinColumn(name="CUSTOMER_ID")
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getServiceState() {
		return serviceState;
	}

	public void setServiceState(String serviceState) {
		this.serviceState = serviceState;
	}

	public String getServiceRequest() {
		return serviceRequest;
	}

	public void setServiceRequest(String serviceRequest) {
		this.serviceRequest = serviceRequest;
	}

	@ManyToOne
	@JoinColumn(name="CREATED_ID")
	public User getCreatedby() {
		return createdby;
	}

	public void setCreatedby(User createdby) {
		this.createdby = createdby;
	}

	@Temporal(TemporalType.DATE)
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@ManyToOne
	@JoinColumn(name="ALLOT_ID")
	public User getAllotTo() {
		return allotTo;
	}

	public void setAllotTo(User allotTo) {
		this.allotTo = allotTo;
	}

	@Temporal(TemporalType.DATE)
	public Date getAllotDate() {
		return allotDate;
	}

	public void setAllotDate(Date allotDate) {
		this.allotDate = allotDate;
	}

	public String getServiceDeal() {
		return serviceDeal;
	}

	public void setServiceDeal(String serviceDeal) {
		this.serviceDeal = serviceDeal;
	}

	@Temporal(TemporalType.DATE)
	public Date getDealDate() {
		return dealDate;
	}

	public void setDealDate(Date dealDate) {
		this.dealDate = dealDate;
	}

	public String getDealResult() {
		return dealResult;
	}

	public void setDealResult(String dealResult) {
		this.dealResult = dealResult;
	}

	public String getSatisfy() {
		return satisfy;
	}

	public void setSatisfy(String satisfy) {
		this.satisfy = satisfy;
	}

}
