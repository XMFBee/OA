package com.oa.bean;

import java.util.Date;

public class Progress {

	//杨健勇
	//课程进度
	private String progressId;//课程进度编号
	
	private String des;//进度详情
	private Date progressDay;//添加进度的时间
	private int status;//状态，默认为可用
	
	private String emp;//员工
	private String grade;//班级
	
	private String empId;//员工编号
	private String gradeId;//班级编号
	
	private Grade grades;
	private Employee employees;
	
	
	public Grade getGrades() {
		return grades;
	}
	public void setGrades(Grade grades) {
		this.grades = grades;
	}
	public Employee getEmployees() {
		return employees;
	}
	public void setEmployees(Employee employees) {
		this.employees = employees;
	}
	public String getEmp() {
		return emp;
	}
	public void setEmp(String emp) {
		this.emp = emp;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getProgressId() {
		return progressId;
	}
	public void setProgressId(String progressId) {
		this.progressId = progressId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
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
	public Date getProgressDay() {
		return progressDay;
	}
	public void setProgressDay(Date progressDay) {
		this.progressDay = progressDay;
	}
	@Override
	public String toString() {
		return "Progress [progressId=" + progressId + ", des=" + des + ", progressDay=" + progressDay + ", status="
				+ status + ", emp=" + emp + ", grade=" + grade + ", empId=" + empId + ", gradeId=" + gradeId
				+ ", grades=" + grades + ", employees=" + employees + "]";
	}
	
	
}
