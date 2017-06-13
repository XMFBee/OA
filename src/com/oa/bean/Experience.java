package com.oa.bean;

import java.util.Date;

public class Experience {
	//郭昶 员工工作经历表
	
	private String expId;//工作经历编号
	private String company;//公司名称
	private Date startDay;//入职时间
	private Date endDay;//离职时间
	private String jobTitle;//职位
	private String des;//工作描述
	public String getExpId() {
		return expId;
	}
	public void setExpId(String expId) {
		this.expId = expId;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Date getStartDay() {
		return startDay;
	}
	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}
	public Date getEndDay() {
		return endDay;
	}
	public void setEndDay(Date endDay) {
		this.endDay = endDay;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	@Override
	public String toString() {
		return "Experience [expId=" + expId + ", company=" + company + ", startDay=" + startDay + ", endDay=" + endDay
				+ ", jobTitle=" + jobTitle + ", des=" + des + "]";
	}
	
	
}
