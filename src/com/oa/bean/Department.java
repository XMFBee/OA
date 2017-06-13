package com.oa.bean;

import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

public class Department {
	//郭昶 部门表
	
	private String depId;//部门编号
	private String name;//名称
	private String des;//描述
	private Integer status;//状态，默认为可用
	
	
	//添加以下
	/**
	 * 自己要使用的外
	 */
	private Employee employee;
	
	/*
	 * 其他bean要使用的
	 */
	private Set<Employee> employees;
	
	public String getDepId() {
		return depId;
	}
	public void setDepId(String depId) {
		this.depId = depId;
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Department [depId=" + depId + ", name=" + name + ", des=" + des + ", status=" + status + "]";
	}

	
	/**
	 * 关联的以下
	 * @return
	 */
	@JSON(serialize=false)
	public Set<Employee> getEmployees() {
		return employees;
	}
	public void setEmployees(Set<Employee> employees) {
		this.employees = employees;
	}
	
	/**
	 * 自连外
	 * @return
	 */
	@JSON(serialize=false)
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
}
