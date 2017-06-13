package com.oa.bean;

import java.util.Date;

/**
 * Created by 赖泰君 on 2016/12/21. 谈心记录表
 */
public class Talk {
	private String talkId;
	// private String empId; // 谈心老师的id
	// private String stuId; // 谈心学生的id
	private Date talkDay; // 谈心时间
	private String des; // 谈心描述
	private int status;
	private Student stu;
	private Employee emp;
	
	
	public Student getStu() {
		return stu;
	}

	public void setStu(Student stu) {
		this.stu = stu;
	}

	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getTalkId() {
		return talkId;
	}

	public void setTalkId(String talkId) {
		this.talkId = talkId;
	}

	/*
	 * public String getEmpId() { return empId; }
	 * 
	 * public void setEmpId(String empId) { this.empId = empId; }
	 * 
	 * public String getStuId() { return stuId; }
	 * 
	 * public void setStuId(String stuId) { this.stuId = stuId; }
	 */

	public Date getTalkDay() {
		return talkDay;
	}

	public void setTalkDay(Date talkDay) {
		this.talkDay = talkDay;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	@Override
	public String toString() {
		return "Talk{" + "talkId='" + talkId + '\'' + ", talkDay=" + talkDay + ", des='" + des + '\'' + ", status="
				+ status + '}';
	}
}
