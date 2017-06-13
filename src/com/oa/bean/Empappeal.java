package com.oa.bean;

import java.util.Date;

/**
 * 邱康 			上诉表
 * */
public class Empappeal {
	private String appealId; // 上诉编号
	//private String empId;
	private Date appealDay; // 提交时间
	private String des;     // 上诉描述
	private int status;     // 状态，默认为可用
	private int firstLevel;  // 直属上司审核，默认为不通过
	private int secondLevel; // 老板审核，默认为不通过
	private int pass;		 // pass
	private Employee employee;
	
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public String getAppealId() {
		return appealId;
	}
	public void setAppealId(String appealId) {
		this.appealId = appealId;
	}
	public Date getAppealDay() {
		return appealDay;
	}
	public void setAppealDay(Date appealDay) {
		this.appealDay = appealDay;
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
	public int getFirstLevel() {
		return firstLevel;
	}
	public void setFirstLevel(int firstLevel) {
		this.firstLevel = firstLevel;
	}
	public int getSecondLevel() {
		return secondLevel;
	}
	public void setSecondLevel(int secondLevel) {
		this.secondLevel = secondLevel;
	}
	public int getPass() {
		return pass;
	}
	public void setPass(int pass) {
		this.pass = pass;
	}
	@Override
	public String toString() {
		return "Empappeal [appealId=" + appealId + ", appealDay=" + appealDay + ", des=" + des + ", status=" + status
				+ ", firstLevel=" + firstLevel + ", secondLevel=" + secondLevel + ", pass=" + pass + "]";
	}
	
	
	

}
