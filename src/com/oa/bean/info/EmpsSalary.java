package com.oa.bean.info;

public class EmpsSalary {
	private String SalaryInfoId;
	private String empId;
	private Double basicSalary;
	private Double jobSalary;

	public String getSalaryInfoId() {
		return SalaryInfoId;
	}

	public void setSalaryInfoId(String salaryInfoId) {
		SalaryInfoId = salaryInfoId;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
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

}
