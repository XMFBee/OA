package com.oa.bean;

import java.util.Date;

import javax.persistence.ManyToOne;

public class Salary {

	// 杨健勇
	// 工资发放
	private String salaryId;// 工资发放编号
	private double extrasalary;// 奖励
	private double subsalary;// 扣罚
	private Date salaryday;// 发放时间
	private double totalsalary;// 总工资

	// 赖泰君 工资发放情况
	@ManyToOne()
	private Employee employee;

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getSalaryId() {
		return salaryId;
	}

	public void setSalaryId(String salaryId) {
		this.salaryId = salaryId;
	}

	public double getExtrasalary() {
		return extrasalary;
	}

	public void setExtrasalary(double extrasalary) {
		this.extrasalary = extrasalary;
	}

	public double getSubsalary() {
		return subsalary;
	}

	public void setSubsalary(double subsalary) {
		this.subsalary = subsalary;
	}

	public Date getSalaryday() {
		return salaryday;
	}

	public void setSalaryday(Date salaryday) {
		this.salaryday = salaryday;
	}

	public double getTotalsalary() {
		return totalsalary;
	}

	public void setTotalsalary(double totalsalary) {
		this.totalsalary = totalsalary;
	}

	@Override
	public String toString() {
		return "Salary [salaryId=" + salaryId + ", extrasalary=" + extrasalary + ", subsalary=" + subsalary
				+ ", salaryday=" + salaryday + ", totalsalary=" + totalsalary + ", employee=" + employee + "]";
	}

}
