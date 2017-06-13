package com.oa.bean.info;

import java.sql.Time;
import java.util.Date;

public class EmpCheckingVOInfo {
	private String empCheckingId;
	private String empId;
	private String empName;
	private String depId;
	private String depName;
	private Date checkingDay;
	public Date getCheckingDay() {
		return checkingDay;
	}
	public void setCheckingDay(Date checkingDay) {
		this.checkingDay = checkingDay;
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
	private Time time1; // 时间点一
	private Time time2; // 时间点二
	private Time time3; // 时间点三
	private Time time4; // 时间点四
	private Time time5; // 时间点五
	private Time time6; // 时间点六
	private Time time7; // 时间点七
	private Time time8; // 时间点八
	public String getEmpCheckingId() {
		return empCheckingId;
	}
	public void setEmpCheckingId(String empCheckingId) {
		this.empCheckingId = empCheckingId;
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
	public Time getTime1() {
		return time1;
	}
	public void setTime1(Time time1) {
		this.time1 = time1;
	}
	public Time getTime2() {
		return time2;
	}
	public void setTime2(Time time2) {
		this.time2 = time2;
	}
	public Time getTime3() {
		return time3;
	}
	public void setTime3(Time time3) {
		this.time3 = time3;
	}
	public Time getTime4() {
		return time4;
	}
	public void setTime4(Time time4) {
		this.time4 = time4;
	}
	public Time getTime5() {
		return time5;
	}
	public void setTime5(Time time5) {
		this.time5 = time5;
	}
	public Time getTime6() {
		return time6;
	}
	public void setTime6(Time time6) {
		this.time6 = time6;
	}
	public Time getTime7() {
		return time7;
	}
	public void setTime7(Time time7) {
		this.time7 = time7;
	}
	public Time getTime8() {
		return time8;
	}
	public void setTime8(Time time8) {
		this.time8 = time8;
	}
	@Override
	public String toString() {
		return "EmpCheckingInfo [empCheckingId=" + empCheckingId + ", empId=" + empId + ", empName=" + empName
				+ ", time1=" + time1 + ", time2=" + time2 + ", time3=" + time3 + ", time4=" + time4 + ", time5=" + time5
				+ ", time6=" + time6 + ", time7=" + time7 + ", time8=" + time8 + "]";
	}
	
	
	
}
