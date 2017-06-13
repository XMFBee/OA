package com.oa.bean.info;

import java.util.Date;

public class MeettingInfo {
	
	//郭昶 
	
	private String meettingId;	//会议编号
	private String empId;		//学生编号
	private String empName;		//主持人名字
	private Date meettingDay;	// 研讨会时间
	private Date createdDay;	// 创建时间
	private String des;			// 研讨会详情
	private int status;		// 状态(默认为1，可用)
	
	
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getMeettingId() {
		return meettingId;
	}
	public void setMeettingId(String meettingId) {
		this.meettingId = meettingId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
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
	@Override
	public String toString() {
		return "MeettingInfo [meettingId=" + meettingId + ", empId=" + empId + ", empName=" + empName + ", meettingDay="
				+ meettingDay + ", createdDay=" + createdDay + ", des=" + des + ", status=" + status + "]";
	}
	
	
}
