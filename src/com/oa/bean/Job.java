package com.oa.bean;

import java.util.Date;

/**
 * 就业表
 * 
 * @author 程燕
 *
 */
public class Job {
	private String jobId; // 学生工作id
	private String company; // 公司名
	private String jobTitle; // 工作名
	private double salary; // 月薪
	private String welfare; // 福利
	private String address; // 地址
	private String comPhone; // 公司电话
	private Date hireDay; // 入职时间
	private int status; // 状态,1为良好,0为冻结

	private Student stu;
	
	
	public Student getStu() {
		return stu;
	}

	public void setStu(Student stu) {
		this.stu = stu;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public String getWelfare() {
		return welfare;
	}

	public void setWelfare(String welfare) {
		this.welfare = welfare;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getComPhone() {
		return comPhone;
	}

	public void setComPhone(String comPhone) {
		this.comPhone = comPhone;
	}

	public Date getHireDay() {
		return hireDay;
	}

	public void setHireDay(Date hireDay) {
		this.hireDay = hireDay;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Job [jobId=" + jobId + ",  company=" + company + ", jobTitle=" + jobTitle
				+ ", salary=" + salary + ", welfare=" + welfare + ", address=" + address + ", comPhone=" + comPhone
				+ ", hireDay=" + hireDay + ", status=" + status + "]";
	}

}
