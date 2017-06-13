package com.oa.bean.info;

import java.util.Date;

/**
 * 用品申购的封装
 * @author XMF
 */
public class GoodsAppInfo {
	
	private String goodsAppId; //用品申购编号
	private String empId;   //员工编号	XMF
	private String empName;	// 申购人名称
	private Date appDay; //申购日期
	private String goodsName; //用品名称
	private int quantity; //申购数量
	private String des; //申购描述
	private int status; //状态，默认可用
	private int appStatus; //申购状态，1为成功。0为失败
	
	public String getGoodsAppId() {
		return goodsAppId;
	}
	public void setGoodsAppId(String goodsAppId) {
		this.goodsAppId = goodsAppId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
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
	public int getQuantity() {
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getAppStatus() {
		return appStatus;
	}
	public void setAppStatus(int appStatus) {
		this.appStatus = appStatus;
	}
	
}
