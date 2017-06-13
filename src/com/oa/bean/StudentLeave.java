package com.oa.bean;

import java.util.Date;

/**
 * Created by 赖泰君 on 2016/12/21. 学生请假表
 */
public class StudentLeave {
	private String leaveId; // 学生请假编号
	// private String stuId; // 学生编号
	private Date startTime; // 开始时间
	private Date endTime; // 结束时间
	private Date leaveDay; // 提交时间
	private String des; // 请假说明
	private int status; // 状态，默认为可用
	private int firLevel; // 任课老师审核，默认不通过
	private int secondLevel; // 班主任审核，默认不通过
	private int pass; // 通过状态，默认为不通过

	private Student stu;  // 一个学生对应多个请假
	
	
	
	public Student getStu() {
		return stu;
	}

	public void setStu(Student stu) {
		this.stu = stu;
	}

	public String getLeaveId() {
		return leaveId;
	}

	public void setLeaveId(String leaveId) {
		this.leaveId = leaveId;
	}

	// public String getStuId() {
	// return stuId;
	// }
	//
	// public void setStuId(String stuId) {
	// this.stuId = stuId;
	// }

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getLeaveDay() {
		return leaveDay;
	}

	public void setLeaveDay(Date leaveDay) {
		this.leaveDay = leaveDay;
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

	public int getFirLevel() {
		return firLevel;
	}

	public void setFirLevel(int firLevel) {
		this.firLevel = firLevel;
	}

	public int getSecondLevel() {
		return secondLevel;
	}

	public void setSecondLevel(int secondLevel) {
		this.secondLevel = secondLevel;
	}

	public int getPass() {
		return pass;
	}

	public void setPass(int pass) {
		this.pass = pass;
	}

	@Override
	public String toString() {
		return "StudentLeave{" + "leaveId='" + leaveId + '\'' + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", leaveDay=" + leaveDay + ", des='" + des + '\'' + ", status=" + status + ", firLevel=" + firLevel
				+ ", secondLevel=" + secondLevel + ", pass=" + pass + '}';
	}
}
