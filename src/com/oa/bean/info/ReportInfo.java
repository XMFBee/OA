package com.oa.bean.info;

import java.util.Date;

public class ReportInfo {
	private String empId;
	private String empName;
	private String depId;
	private String depName;
	private String reportId;
	private String des;
	private Date reportday;
	private Integer status;
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
	public String getReportId() {
		return reportId;
	}
	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public Date getReportday() {
		return reportday;
	}
	public void setReportday(Date reportday) {
		this.reportday = reportday;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "ReportInfo [empId=" + empId + ", empName=" + empName + ", depId=" + depId + ", depName=" + depName
				+ ", reportId=" + reportId + ", des=" + des + ", reportday=" + reportday + ", status=" + status + "]";
	}
	
}
