package com.oa.bean;

public class Educational {
	//郭昶 员工教育背景表
	
	private String eduId;//教育背景编号
	private String school;//毕业学校
	private String startDay;//开始时间
	private String endDay;//结束时间
	private String des;//描述
	public String getEduId() {
		return eduId;
	}
	public void setEduId(String eduId) {
		this.eduId = eduId;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	@Override
	public String toString() {
		return "Educational [eduId=" + eduId + ", school=" + school + ", startDay=" + startDay + ", endDay=" + endDay
				+ ", des=" + des + "]";
	}
	
	
}
