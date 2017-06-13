package com.oa.bean;

import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

public class NoticeType {

	// 公告类型 XMF
	private String noticetypeId; // 公告类型编号
	private String name; // 公告标题
	private String des; // 公告描述
	private int status; // 状态(默认为可用,1)
	private Set<Notice> notice;

	@JSON(serialize = false)
	public Set<Notice> getNotice() {
		return notice;
	}

	public void setNotice(Set<Notice> notice) {
		this.notice = notice;
	}

	public String getNoticetypeId() {
		return noticetypeId;
	}

	public void setNoticetypeId(String noticetypeId) {
		this.noticetypeId = noticetypeId;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "NoticeType [noticetypeId=" + noticetypeId + ", name=" + name + ", des=" + des + ", status=" + status
				+ "]";
	}

}
