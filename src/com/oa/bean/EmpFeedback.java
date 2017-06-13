package com.oa.bean;

import java.util.Date;

/**
 * 邱康			员工反馈表
 * */
public class EmpFeedback {
	private String feedbackId; // 反馈编号

	private Date feedbackDay; // 反馈时间
	private String des; //    反馈描述
	private int status; //  状态，默认为可用
	
	private Employee emp; 		//员工
	private String empId; 		//员工编号
	
	
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public Employee getEmp() {
		return emp;
	}
	public void setEmp(Employee emp) {
		this.emp = emp;
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
	@Override
	public String toString() {
		return "EmpFeedback [feedbackId=" + feedbackId + ", feedbackDay=" + feedbackDay + ", des=" + des + ", status="
				+ status + ", emp=" + emp + ", empId=" + empId + "]";
	}
	
	
	
	
}
