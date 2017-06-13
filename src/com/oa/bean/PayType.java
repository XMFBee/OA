package com.oa.bean;

import java.util.Set;

public class PayType {

	// 支出类别 XMF

	private String payTypeId; // 支出类别编号
	private String name; // 支出类别
	private String des; // 支出描述
	private int status; // 状态(默认为可用,1)
	private Set<Pay> pay; // 写多方数据

	public Set<Pay> getPay() {
		return pay;
	}

	public void setPay(Set<Pay> pay) {
		this.pay = pay;
	}

	public String getPayTypeId() {
		return payTypeId;
	}

	public void setPayTypeId(String payTypeId) {
		this.payTypeId = payTypeId;
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
		return "PayType [payTypeId=" + payTypeId + ", name=" + name + ", des=" + des + ", status=" + status + ", pay="
				+ pay + "]";
	}

}
