package com.oa.bean;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

public class Empleave {
	//郭昶 员工请假表
	private String leaveId;//请假编号
	private Date startTime;//开始时间
	private Date endTime;//结束时间
	private Date leaveDay;//提交时间
	private String des;//请假描述
	private int status;//状态，默认可用
	private int firstLevel;//直属上司审核，默认为不通过
	private int secondLevel;//老板审核，默认为为不通过
	private int pass;//通过状态，默认为不通过
	
	private Employee employee;
	public String getLeaveId() {
		return leaveId;
	}
	public void setLeaveId(String leaveId) {
		this.leaveId = leaveId;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Date getLeaveDay() {
		return leaveDay;
	}
	public void setLeaveDay(Date leaveDay) {
		this.leaveDay = leaveDay;
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
		return "Empleave [leaveId=" + leaveId + ", startTime=" + startTime + ", endTime=" + endTime + ", leaveDay="
				+ leaveDay + ", des=" + des + ", status=" + status + ", firstLevel=" + firstLevel + ", secondLevel="
				+ secondLevel + ", pass=" + pass + "]";
	}
	@JSON(serialize=false)
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
}
