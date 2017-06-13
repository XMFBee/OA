package com.oa.bean.info;

import java.util.Date;

public class PayInfo {
	
	//郭玉清
	private String payId;//支出管理编号
	private String empName;//员工姓名
	private String payTypeName;//支出类型
	private Date payDay;//支出时间
	private String des;//描述
	private double pay;//支出金额
	private String toName;//收款人姓名
	private String toPhone;//收款人号码
	private int payTypeStatus; //支出类型状态
	private String empId; //员工ID
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getPayId() {
		return payId;
	}
	public void setPayId(String payId) {
		this.payId = payId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getPayTypeName() {
		return payTypeName;
	}
	public void setPayTypeName(String payTypeName) {
		this.payTypeName = payTypeName;
	}
	public Date getPayDay() {
		return payDay;
	}
	public void setPayDay(Date payDay) {
		this.payDay = payDay;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public double getPay() {
		return pay;
	}
	public void setPay(double pay) {
		this.pay = pay;
	}
	public String getToName() {
		return toName;
	}
	public void setToName(String toName) {
		this.toName = toName;
	}
	public String getToPhone() {
		return toPhone;
	}
	public void setToPhone(String toPhone) {
		this.toPhone = toPhone;
	}
	public int getPayTypeStatus() {
		return payTypeStatus;
	}
	public void setPayTypeStatus(int payTypeStatus) {
		this.payTypeStatus = payTypeStatus;
	}
	@Override
	public String toString() {
		return "PayInfo [payId=" + payId + ", empName=" + empName + ", payTypeName=" + payTypeName + ", payDay="
				+ payDay + ", des=" + des + ", pay=" + pay + ", toName=" + toName + ", toPhone=" + toPhone
				+ ", payTypeStatus=" + payTypeStatus + ", empId=" + empId + "]";
	}
	
}
