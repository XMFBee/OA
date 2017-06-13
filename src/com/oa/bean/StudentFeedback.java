package com.oa.bean;

import java.util.Date;


/**
 * Created by 赖泰君 on 2016/12/21. 学生反馈表
 */
public class StudentFeedback {

	private String feedbackId;
	private String stuId; // 反馈的学生的id
	private Date feedbackDay; // 反馈时间
	private String des; // 反馈描述
	private int status; // 状态，默认可用

	private Student stu; // 多个反馈对应一个学生
	
	
	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public Student getStu() {
		return stu;
	}

	public void setStu(Student stu) {
		this.stu = stu;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(String feedbackId) {
		this.feedbackId = feedbackId;
	}

	// public String getStuId() {
	// return stuId;
	// }
	//
	// public void setStuId(String stuId) {
	// this.stuId = stuId;
	// }

	public Date getFeedbackDay() {
		return feedbackDay;
	}

	public void setFeedbackDay(Date feedbackDay) {
		this.feedbackDay = feedbackDay;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	@Override
	public String toString() {
		return "StudentFeedback [feedbackId=" + feedbackId + ", stuId=" + stuId + ", feedbackDay=" + feedbackDay
				+ ", des=" + des + ", status=" + status + ", stu=" + stu + "]";
	}

	
}
