package com.atuigu.crm.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Table(name="ROLES")
@Entity
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Role extends IdEntity {

	// 角色名称
	private String name;
	// 角色描述
	private String description;
	// 角色状态: 角色是否可用
	private boolean enabled;
	// 角色拥有的权限
	private List<Authority> authorities = new ArrayList<>();
	//该角色分配给了哪些用户
	private Set<User> users = new HashSet<>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@ManyToMany
	@JoinTable(
		name="ROLE_AUTHORITY", 
		joinColumns={@JoinColumn(name="ROLE_ID")},
		inverseJoinColumns={@JoinColumn(name="AUTHORITY_ID")}
	)
	@Fetch(FetchMode.JOIN)
	@OrderBy("ID")
	@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
	public List<Authority> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(List<Authority> authorities) {
		this.authorities = authorities;
	}
	
	public void setAuthorities2(List<String> authorities){
		this.authorities.clear();
		for(String authorityId: authorities){
			this.authorities.add(new Authority(Long.parseLong(authorityId)));
		}
	}
	
	@Transient
	public List<String> getAuthorities2(){
		List<String> authorites = new ArrayList<>();
		for(Authority authority:this.authorities){
			authorites.add("" + authority.getId());
		}
		
		return authorites;
	}

	@OneToMany(mappedBy="role")
	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	
}
