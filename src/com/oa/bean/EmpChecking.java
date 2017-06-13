package com.oa.bean;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

/**
 * 
 * 邱康  员工考勤表
 * */
public class EmpChecking {
	private String checkingId; // 考勤编号
	private Employee employee;
	private Date checkingDay; // 打卡日期
	private Date time1; // 时间点一
	private Date time2; // 时间点二
	private Date time3; // 时间点三
	private Date time4; // 时间点四
	private Date time5; // 时间点五
	private Date time6; // 时间点六
	private Date time7; // 时间点七
	private Date time8; // 时间点八
	public String getCheckingId() {
		return checkingId;
	}
	public void setCheckingId(String checkingId) {
		this.checkingId = checkingId;
	}
	public Date getCheckingDay() {
		return checkingDay;
	}
	public void setCheckingDay(Date checkingDay) {
		this.checkingDay = checkingDay;
	}
	public Date getTime1() {
		return time1;
	}
	public void setTime1(Date time1) {
		this.time1 = time1;
	}
	public Date getTime2() {
		return time2;
	}
	public void setTime2(Date time2) {
		this.time2 = time2;
	}
	public Date getTime3() {
		return time3;
	}
	public void setTime3(Date time3) {
		this.time3 = time3;
	}
	public Date getTime4() {
		return time4;
	}
	public void setTime4(Date time4) {
		this.time4 = time4;
	}
	public Date getTime5() {
		return time5;
	}
	public void setTime5(Date time5) {
		this.time5 = time5;
	}
	public Date getTime6() {
		return time6;
	}
	public void setTime6(Date time6) {
		this.time6 = time6;
	}
	public Date getTime7() {
		return time7;
	}
	public void setTime7(Date time7) {
		this.time7 = time7;
	}
	public Date getTime8() {
		return time8;
	}
	public void setTime8(Date time8) {
		this.time8 = time8;
	}
	@Override
	public String toString() {
		return "Empchecking [checkingId=" + checkingId + ", checkingDay=" + checkingDay + ", time1=" + time1
				+ ", time2=" + time2 + ", time3=" + time3 + ", time4=" + time4 + ", time5=" + time5 + ", time6=" + time6
				+ ", time7=" + time7 + ", time8=" + time8 + "]";
	}
	@JSON(serialize=false)
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
}
