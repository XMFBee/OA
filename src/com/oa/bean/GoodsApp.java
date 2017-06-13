package com.oa.bean;

import java.util.Date;

//郭昶 用品申购表

public class GoodsApp {

	private String goodsAppId;	 // 用品申购编号
	private Employee emp; 		// 员工编号 申购人 XMF
//	private String empId;
	private Date appDay;	 	// 申购日期
	private String goodsName; 	// 用品名称 	XMF	不存在这个申购的用品到底存不存在
	private int quantity; 		// 申购数量
	private String des; 		// 申购描述
	private int status; 		// 状态，默认可用
	private int appStatus; 		// 申购状态，1为成功。0为失败

	public String getGoodsAppId() {
		return goodsAppId;
	}

	public void setGoodsAppId(String goodsAppId) {
		this.goodsAppId = goodsAppId;
	}

	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}

	public Date getAppDay() {
		return appDay;
	}

	public void setAppDay(Date appDay) {
		this.appDay = appDay;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Integer getAppStatus() {
		return appStatus;
	}

	public void setAppStatus(int appStatus) {
		this.appStatus = appStatus;
	}

//	public String getEmpId() {
//		return empId;
//	}
//
//	public void setEmpId(String empId) {
//		this.empId = empId;
//	}

}
