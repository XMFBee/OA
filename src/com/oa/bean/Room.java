package com.oa.bean;

import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

public class Room {

	private String roomId;//宿舍编号
	private String name;//名称
	
	private Set<Student> stus; // 一个宿舍有多个人
	
	private int quantity;//宿舍最大人数
	private int status;//状态，默认为可用
	
	private Student stu; // 宿舍长
	private String stuId;
	
	private int fact;		// 当前宿舍实际人数
	
	
	
	public int getFact() {
		return fact;
	}
	public void setFact(int fact) {
		this.fact = fact;
	}
	public Student getStu() {
		return stu;
	}
	public void setStu(Student stu) {
		this.stu = stu;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public Set<Student> getStus() {
		return stus;
	}
	public void setStus(Set<Student> stus) {
		this.stus = stus;
	}
	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", name=" + name + ",  quantity=" + quantity + ", status="
				+ status + "]";
	}
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	
}
