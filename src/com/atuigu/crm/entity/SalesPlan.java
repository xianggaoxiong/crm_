package com.atuigu.crm.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Table(name="SALES_PLAN")
@Entity
public class SalesPlan extends IdEntity {

	// 计划实施的时间
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date date;
	// 计划怎么做
	private String todo;
	// 计划的执行结果
	private String result;
	// 对应的销售机会
	private SalesChance chance;

	@Temporal(TemporalType.DATE)
	@Column(name="PLAN_DATE")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTodo() {
		return todo;
	}

	public void setTodo(String todo) {
		this.todo = todo;
	}

	@Column(name="PLAN_RESULT")
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@ManyToOne
	@JoinColumn(name="CHANCE_ID")
	public SalesChance getChance() {
		return chance;
	}

	public void setChance(SalesChance chance) {
		this.chance = chance;
	}

}
