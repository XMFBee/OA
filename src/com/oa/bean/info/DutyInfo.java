package com.oa.bean.info;

public class DutyInfo {
	private String dutyId;//值班编号
	private String weekday;//周几
	
	private String empId;
	private String empName;
	public String getDutyId() {
		return dutyId;
	}
	public void setDutyId(String dutyId) {
		this.dutyId = dutyId;
	}
	public String getWeekday() {
		return weekday;
	}
	public void setWeekday(String weekday) {
		this.weekday = weekday;
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
	@Override
	public String toString() {
		return "DutyInfo [dutyId=" + dutyId + ", weekday=" + weekday + ", empId=" + empId + ", empName=" + empName
				+ "]";
	}
	
	
}
