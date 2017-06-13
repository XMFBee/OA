package com.oa.bean;

/**
 * Created by 赖泰君 on 2016/12/21.
 */
public class SalaryInfo {
	private String salaryInfoId; // 工资情况编号
	private String empId; // 员工编号
	private Double basicSalary; // 基本工资
	private Double jobSalary; // 岗位工资

	private Employee emp;

	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}

	public String getSalaryInfoId() {
		return salaryInfoId;
	}

	public void setSalaryInfoId(String salaryInfoId) {
		this.salaryInfoId = salaryInfoId;
	}

	public Double getBasicSalary() {
		return basicSalary;
	}

	public void setBasicSalary(Double basicSalary) {
		this.basicSalary = basicSalary;
	}

	public Double getJobSalary() {
		return jobSalary;
	}

	public void setJobSalary(Double jobSalary) {
		this.jobSalary = jobSalary;
	}
	
	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	@Override
	public String toString() {
		return "SalaryInfo{" + "salaryInfoId='" + salaryInfoId + '\'' + ", basicSalary=" + basicSalary + ", jobSalary="
				+ jobSalary + '}';
	}
}
