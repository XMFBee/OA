package com.oa.bean;

import java.util.Date;

/**
 * Created by 赖泰君 on 2016/12/21. 成绩表
 */
public class Score {
	private String scoreId; // 成绩编号
	// private String stuId; // 学生编号
	// private String courseId; // 课程编号
	private String score; // 分数
	private Date testDay; // 考试时间
	
	private Student stu;
	private Course course;
	
	

	public Student getStu() {
		return stu;
	}

	public void setStu(Student stu) {
		this.stu = stu;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getScoreId() {
		return scoreId;
	}

	public void setScoreId(String scoreId) {
		this.scoreId = scoreId;
	}

	/*
	 * public String getCourseId() { return courseId; }
	 * 
	 * public void setCourseId(String courseId) { this.courseId = courseId; }
	 */

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public Date getTestDay() {
		return testDay;
	}

	public void setTestDay(Date testDay) {
		this.testDay = testDay;
	}

	@Override
	public String toString() {
		return "Score{" + "scoreId='" + scoreId + '\'' + ", score='" + score + '\'' + ", testDay=" + testDay + '}';
	}
}
