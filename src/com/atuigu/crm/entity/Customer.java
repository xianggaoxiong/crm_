package com.atuigu.crm.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name="CUSTOMERS")
@Entity
public class Customer extends IdEntity{

	//客户编号
	private String no;
	//姓名
	private String name;
	
	//区域
	private String region;
	//客户经理
	private Contact manager;
	
	//客户等级
	private String level;
	
	//客户满意度
	private String satify;
	
	//客户信用度
	private String credit;
	
	//客户地址
	private String address;
	//邮编
	private String zip;
	
	//联系电话
	private String tel;
	//客户传真
	private String fax;
	
	//网址
	private String websit;
	//执照注册号
	private String licenceNo;
	
	//法人
	private String chief;
	//注册资金
	private Long bankroll;
	
	//年营业额
	private Long turnover;
	//开户行
	private String bank;
	
	//银行账号
	private String bankAccount;
	//地税登记号
	private String localTaxNo;
	
	//国税登记号
	private String nationalTaxNo;
	//客户状态
	private String state;
	
	//联系人信息
	private Set<Contact> contacts = new HashSet<>();
	
	//订单信息
	private Set<Order> orders = new HashSet<>();

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	@OneToOne(cascade=CascadeType.REMOVE)
	@JoinColumn(name="MANAGER_ID")
	public Contact getManager() {
		return manager;
	}

	public void setManager(Contact manager) {
		this.manager = manager;
	}

	@Column(name="CUSTOMER_LEVEL")
	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getSatify() {
		return satify;
	}

	public void setSatify(String satify) {
		this.satify = satify;
	}

	public String getCredit() {
		return credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getWebsit() {
		return websit;
	}

	public void setWebsit(String websit) {
		this.websit = websit;
	}

	public String getLicenceNo() {
		return licenceNo;
	}

	public void setLicenceNo(String licenceNo) {
		this.licenceNo = licenceNo;
	}

	public String getChief() {
		return chief;
	}

	public void setChief(String chief) {
		this.chief = chief;
	}

	public Long getBankroll() {
		return bankroll;
	}

	public void setBankroll(Long bankroll) {
		this.bankroll = bankroll;
	}

	public Long getTurnover() {
		return turnover;
	}

	public void setTurnover(Long turnover) {
		this.turnover = turnover;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public String getLocalTaxNo() {
		return localTaxNo;
	}

	public void setLocalTaxNo(String localTaxNo) {
		this.localTaxNo = localTaxNo;
	}

	public String getNationalTaxNo() {
		return nationalTaxNo;
	}

	public void setNationalTaxNo(String nationalTaxNo) {
		this.nationalTaxNo = nationalTaxNo;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@OneToMany(mappedBy="customer")
	@OrderBy("id")
	public Set<Contact> getContacts() {
		return contacts;
	}

	public void setContacts(Set<Contact> contacts) {
		this.contacts = contacts;
	}

	@OneToMany(mappedBy="customer")
	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	
	@Transient
	public Long getOrderMoney(){
		Long money = 0L;
		
		for(Order order: orders){ 
			for(OrderItem item: order.getItems()){
				money += item.getMoney(); 
			}			
		}
		return money;
	}

	@Override
	public String toString() {
		return "Customer [no=" + no + "]";
	}
	
	
}
