package com.oa.bean.info;

import java.util.Date;

public class EmpfeedbackInfo {
	//郭昶 反馈info表
	private String feedbackId; // 反馈编号
	private Date feedbackDay; // 反馈时间
	private String des; //    反馈描述
	private int status; //  状态，默认为可用
	private String empName;//员工姓名
	private String empId;		//员工编号
	
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getFeedbackId() {
		return feedbackId;
	}
	public void setFeedbackId(String feedbackId) {
		this.feedbackId = feedbackId;
	}
	public Date getFeedbackDay() {
		return feedbackDay;
	}
	public void setFeedbackDay(Date feedbackDay) {
		this.feedbackDay = feedbackDay;
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
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	@Override
	public String toString() {
		return "EmpfeedbackInfo [feedbackId=" + feedbackId + ", feedbackDay=" + feedbackDay + ", des=" + des
				+ ", status=" + status + ", empName=" + empName + ", empId=" + empId + "]";
	}
	
	
	
}
