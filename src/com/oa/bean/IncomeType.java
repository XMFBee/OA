package com.oa.bean;

import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

/**
 * 收入类型表
 * 
 * @author 程燕
 *
 */
public class IncomeType {
	private String incomeTypeId; // 收入类型的id
	private String name; // 收入类型的名称
	private String des; // 收入类型的简介
	private int status; // 该收入类型是否可用(1为可用,0为不可用)
	
	// 赖泰君 收入类型 
	private Set<Income> incomes;

	@JSON(serialize = false)
	public Set<Income> getIncomes() {
		return incomes;
	}

	public void setIncomes(Set<Income> incomes) {
		this.incomes = incomes;
	}

	public String getIncomeTypeId() {
		return incomeTypeId;
	}

	public void setIncomeTypeId(String incomeTypeId) {
		this.incomeTypeId = incomeTypeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "IncomeType [incomeTypeId=" + incomeTypeId + ", name=" + name + ", des=" + des + ", status=" + status
				+ "]";
	}

}
