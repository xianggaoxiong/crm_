package com.atuigu.crm.entity;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Table(name="AUTHORITIES")
@Entity
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Authority extends IdEntity{

	//权限的名字, 用于显示
	private String displayName;
	//权限的名字: 用于配置 Shiro
	private String name;
	//权限允许的行为: 即权限的具体内容.
	private String permissions;
	//父权限
	private Authority parentAuthority;
	//URL 地址
	private String url;
	//子权限
	private List<Authority> subAuthorities = new ArrayList<>();
	
	public Authority(Long id) {
		this.id = id;
	}
	
	public Authority() {
		// TODO Auto-generated constructor stub
	}
	
	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPermissions() {
		return permissions;
	}

	public void setPermissions(String permissions) {
		this.permissions = permissions;
	}
	
	@ManyToOne
	@JoinColumn(name="PARENT_AUTHORITY_ID")
	public Authority getParentAuthority() {
		return parentAuthority;
	}

	public void setParentAuthority(Authority parentAuthority) {
		this.parentAuthority = parentAuthority;
	}

	@OneToMany(mappedBy="parentAuthority")
	public List<Authority> getSubAuthorities() {
		return subAuthorities;
	}

	public void setSubAuthorities(List<Authority> subAuthorities) {
		this.subAuthorities = subAuthorities;
	}

	@Transient
	public List<String> getPermissionList(){
		return Arrays.asList(permissions.split(","));
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
