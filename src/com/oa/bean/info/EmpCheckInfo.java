package com.oa.bean.info;

import java.sql.Time;
import java.util.Date;

public class EmpCheckInfo {
	private String depId;
	private String depName;
	private String empId;
	private String empName;
	private String checkId;
	private String roomId;
	private String roomName;
	private String gradeId;
	private String gradeName;
	private Date weekday;
	private Time checkTime;
	private String des;
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
	public String getCheckId() {
		return checkId;
	}
	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public Date getWeekday() {
		return weekday;
	}
	public void setWeekday(Date weekday) {
		this.weekday = weekday;
	}
	public Time getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(Time checkTime) {
		this.checkTime = checkTime;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	@Override
	public String toString() {
		return "EmpCheckInfo [depId=" + depId + ", depName=" + depName + ", empId=" + empId + ", empName=" + empName
				+ ", checkId=" + checkId + ", roomId=" + roomId + ", roomName=" + roomName + ", gradeId=" + gradeId
				+ ", gradeName=" + gradeName + ", weekday=" + weekday + ", checkTime=" + checkTime + ", des=" + des + "]";
	}
	
	
}
