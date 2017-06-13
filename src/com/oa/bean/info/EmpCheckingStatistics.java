package com.oa.bean.info;

import java.util.Date;

public class EmpCheckingStatistics {
	private String empid;
	private String empname;
	private String depid;
	private String depname;
	private Integer laterCount;
	private Integer forgetCount;
	private Date checkingday;
	private Integer leaveCount;
	public Date getCheckingday() {
		return checkingday;
	}
	public void setCheckingday(Date checkingday) {
		this.checkingday = checkingday;
	}
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	public String getDepid() {
		return depid;
	}
	public void setDepid(String depid) {
		this.depid = depid;
	}
	public String getDepname() {
		return depname;
	}
	public void setDepname(String depname) {
		this.depname = depname;
	}
	public Integer getLaterCount() {
		return laterCount;
	}
	public void setLaterCount(Integer laterCount) {
		this.laterCount = laterCount;
	}
	public Integer getForgetCount() {
		return forgetCount;
	}
	public void setForgetCount(Integer forgetCount) {
		this.forgetCount = forgetCount;
	}
	@Override
	public String toString() {
		return "EmpCheckingStatistics [empid=" + empid + ", empname=" + empname + ", depid=" + depid + ", depname="
				+ depname + ", laterCount=" + laterCount + ", forgetCount=" + forgetCount + ", checkingday="
				+ checkingday + "]";
	}
	public Integer getLeaveCount() {
		return leaveCount;
	}
	public void setLeaveCount(Integer leaveCount) {
		this.leaveCount = leaveCount;
	}
	
	
	
}
