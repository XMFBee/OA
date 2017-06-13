package com.oa.bean;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

public class Notice {

	// 公告 XMF
	private String noticeId; // 公告编号
	private String name; // 公告标题
	private String des; // 公告详情

	private NoticeType noticetype; // 公告类型
	private Date noticeDay; // 发布时间
	private int status; // 状态(默认为可用,1)
	private Employee emp; //员工对象
	private String empId; // 发布人ID
	private String noticetypeid;

	
	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}

	public void setNoticetypeid(String noticetypeid) {
		this.noticetypeid = noticetypeid;
	}

	public String getNoticetypeid() {
		return noticetypeid;
	}

	public NoticeType getNoticetype() {
		return noticetype;
	}

	@JSON(serialize = false)
	public void setNoticetype(NoticeType noticetype) {
		this.noticetype = noticetype;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public int getStatus() {
		return status;
	}

	public String getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}

	public void setStatus(int status) {
		this.status = status;
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

	public Date getNoticeDay() {
		return noticeDay;
	}

	public void setNoticeDay(Date noticeDay) {
		this.noticeDay = noticeDay;
	}

	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", name=" + name + ", des=" + des + ", noticetype=" + noticetype
				+ ", noticeDay=" + noticeDay + ", status=" + status + ", empId=" + empId + "]";
	}

}
