package com.oa.bean.info;

import java.util.Date;

public class EmpappealInfo {
	private String empId;
	private String empName;
	private String depId;
	private String depName;
	private String appealId;
	private Date appealDay;
	private String des;
	private Integer status;
	private Integer firstLeave;
	private Integer secondLeave;
	private Integer pass;
	
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getFirstLeave() {
		return firstLeave;
	}
	public void setFirstLeave(Integer firstLeave) {
		this.firstLeave = firstLeave;
	}
	public Integer getSecondLeave() {
		return secondLeave;
	}
	public void setSecondLeave(Integer secondLeave) {
		this.secondLeave = secondLeave;
	}
	public Integer getPass() {
		return pass;
	}
	public void setPass(Integer pass) {
		this.pass = pass;
	}
	@Override
	public String toString() {
		return "EmpappealInfo [empId=" + empId + ", empName=" + empName + ", depId=" + depId + ", depName=" + depName
				+ ", appealId=" + appealId + ", appealDay=" + appealDay + ", des=" + des + ", status=" + status
				+ ", firstLeave=" + firstLeave + ", secondLeave=" + secondLeave + ", pass=" + pass + "]";
	}
	
	
}
