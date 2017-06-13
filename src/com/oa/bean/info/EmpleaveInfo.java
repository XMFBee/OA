package com.oa.bean.info;

import java.util.Date;

public class EmpleaveInfo {
	private String leaveId;
	private Date startTime;//开始时间
	private Date endTime;//结束时间
	private Date leaveDay;//提交时间
	private String des;//请假描述
	private int status;//状态，默认可用
	private int firstLeave;//直属上司审核，默认为不通过
	private int secondLeave;//老板审核，默认为为不通过
	private int pass;//通过状态，默认为不通过
	private String depId;
	private String depName;
	private String empId;
	private String empName;
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
	public int getFirstLeave() {
		return firstLeave;
	}
	public void setFirstLeave(int firstLeave) {
		this.firstLeave = firstLeave;
	}
	public int getSecondLeave() {
		return secondLeave;
	}
	public void setSecondLeave(int secondLeave) {
		this.secondLeave = secondLeave;
	}
	public int getPass() {
		return pass;
	}
	public void setPass(int pass) {
		this.pass = pass;
	}
	public String getDepId() {
		return depId;
	}
	public void setDepId(String depId) {
		this.depId = depId;
	}
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	
}
