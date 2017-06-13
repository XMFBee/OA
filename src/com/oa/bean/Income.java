package com.oa.bean;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

/**
 * 收入表
 * 
 * @author 程燕
 *
 */
public class Income {
	private String incomeId; // 收入id
	private String incomeTypeId; // 收入类型id(关联到收入类型表)
	private Date incomeDay; // 收入时间
	private String des; // 收入简介
	private double income; // 收入金额
	private String empId; // 添加该记录的员工id
	private String stuId; // 学生id //可以为空,收入类型里没有指明哪个学生交的学费,所以这里需要学生id

	// 赖泰君 
	private Employee employee;
	private Student student;

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	// 赖泰君 收入类型
	private IncomeType incomeType;

	public String getIncomeTypeId() {
		return incomeTypeId;
	}

	public void setIncomeTypeId(String incomeTypeId) {
		this.incomeTypeId = incomeTypeId;
	}

	public IncomeType getIncomeType() {
		return incomeType;
	}

	public void setIncomeType(IncomeType incomeType) {
		this.incomeType = incomeType;
	}

	public String getIncomeId() {
		return incomeId;
	}

	public void setIncomeId(String incomeId) {
		this.incomeId = incomeId;
	}

	public Date getIncomeDay() {
		return incomeDay;
	}

	public void setIncomeDay(Date incomeDay) {
		this.incomeDay = incomeDay;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public double getIncome() {
		return income;
	}

	public void setIncome(double income) {
		this.income = income;
	}

	@Override
	public String toString() {
		return "Income [incomeId=" + incomeId + ", incomeDay=" + incomeDay + ", des=" + des + ", income=" + income
				+ "]";
	}

}
