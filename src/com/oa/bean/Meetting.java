package com.oa.bean;

import java.util.Date;

public class Meetting {
	
	// 研讨会	XMF
	private String meettingId;	// 研讨会编号
	private Date meettingDay;	// 研讨会时间
	private Date createdDay;	// 创建时间
	private String des;			// 研讨会详情
	private int status;		// 状态(默认为1，可用)
	
	private Employee emp;		// 主持人
	private String empId;		//主持人编号
	
	
	public String getMeettingId() {
		return meettingId;
	}
	public void setMeettingId(String meettingId) {
		this.meettingId = meettingId;
	}
	
	
	public Date getMeettingDay() {
		return meettingDay;
	}
	public void setMeettingDay(Date meettingDay) {
		this.meettingDay = meettingDay;
	}
	public Date getCreatedDay() {
		return createdDay;
	}
	public void setCreatedDay(Date createdDay) {
		this.createdDay = createdDay;
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
	public Employee getEmp() {
		return emp;
	}
	public void setEmp(Employee emp) {
		this.emp = emp;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	@Override
	public String toString() {
		return "Meetting [meettingId=" + meettingId + ", meettingDay=" + meettingDay + ", createdDay=" + createdDay
				+ ", des=" + des + ", status=" + status + ", emp=" + emp + ", empId=" + empId + "]";
	}
	
	
	
	
	
	

}
