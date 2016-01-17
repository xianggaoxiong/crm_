package com.atuigu.crm.entity;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="USERS")
public class User extends IdEntity{

	private String name;
	private String password;
	private int enabled ;
	//盐值, 进行密码加密
	private String salt;
	//该用户拥有的角色
	private Role role;

	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	@ManyToOne
	@JoinColumn(name="ROLE_ID")
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Transient
	public Collection<String> getRoleList() {
		Collection<String> roles =  new ArrayList<>();
		
		if(role != null){
			for(Authority authority: role.getAuthorities()){
				roles.add(authority.getName());
			}			
		}
		
		return roles;
	}
}
