package com.atuigu.crm.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Table(name = "PRODUCTS")
@Entity
public class Product extends IdEntity {

	// 产品名称
	private String name;
	// 产品型号
	private String type;

	// 产品批次
	private String batch;
	// 产品单位
	private String unit;

	// 单价
	private int price;
	// 备注
	private String memo;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBatch() {
		return batch;
	}

	public void setBatch(String batch) {
		this.batch = batch;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

}
