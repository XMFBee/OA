package com.oa.bean;

import java.util.Set;

public class Course {
	//郭昶 课程表
	
	private String courseId;//课程编号
	private String name;//名称
	private String des;//描述
	private int totalHour;//总课时数
	private int term;//学期
	private int courseOrder;//课程顺序
	private int status;//状态，默认可用
	
	private Set<Score> scores; // 一门课程有多个成绩 
	
	
	

	public Set<Score> getScores() {
		return scores;
	}
	public void setScores(Set<Score> scores) {
		this.scores = scores;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public int getTotalHour() {
		return totalHour;
	}
	public void setTotalHour(int totalHour) {
		this.totalHour = totalHour;
	}
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	public int getCourseOrder() {
		return courseOrder;
	}
	public void setCourseOrder(int courseOrder) {
		this.courseOrder = courseOrder;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", name=" + name + ", des=" + des + ", totalHour=" + totalHour
				+ ", term=" + term + ", courseOrder=" + courseOrder + ", status=" + status + "]";
	}
	
}
