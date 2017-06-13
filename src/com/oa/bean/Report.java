package com.oa.bean;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

public class Report {

	//杨健勇
	//工作日志
	private String reportId;//工作日志编号
	private Date reportday;//日志时间
	private String des;//描述
	private int status;//状态，默认为可用
	
	private Employee employee;
	
	
	public String getReportId() {
		return reportId;
	}
	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	public Date getReportday() {
		return reportday;
	}
	public void setReportday(Date reportday) {
		this.reportday = reportday;
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
		return "Report [reportId=" + reportId + ", reportday=" + reportday + ", des=" + des
				+ ", status=" + status + "]";
	}
	
	@JSON(serialize=false)
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
}
