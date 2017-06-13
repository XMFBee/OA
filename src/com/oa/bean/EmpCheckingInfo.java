package com.oa.bean;
/**
 * 邱康   		员工考勤表
 * */
public class EmpCheckingInfo {
	private String checkingInfoId; // 考勤表编号
	private String name; // 名称
	private String checkingTime; // 
	public String getCheckingInfoId() {
		return checkingInfoId;
	}
	public void setCheckingInfoId(String checkingInfoId) {
		this.checkingInfoId = checkingInfoId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCheckingTime() {
		return checkingTime;
	}
	public void setCheckingTime(String checkingTime) {
		this.checkingTime = checkingTime;
	}
	@Override
	public String toString() {
		return "EmpCheckingInfo [checkingInfoId=" + checkingInfoId + ", name=" + name + ", checkingTime=" + checkingTime
				+ "]";
	}
	
	
	
}
